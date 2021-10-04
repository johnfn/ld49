extends Node2D
class_name BattleScene

enum ACTIONS {insult, cry}

export var enemy_pos = Vector2(700, 200)
export var player_pos = Vector2(200, 400)

var turn_queue = []
onready var player = $Player
onready var enemy = $Enemy
var enemies = []
var targeting_index

onready var targeting_marker = $'HUD/TargetingMarker'
onready var battle_ui = $'HUD/BattleOptions'

var player_tscn = load("res://BattlePlayer.tscn")

var minigame
var minigame_tscn = load("res://InsultMinigame.tscn") 
var is_in_minigame = false

var movement_queue = {}

var hp_bar_len = 143
onready var player_hp_bar = $HUD/BattleOptions/HealthBar/HealthSprite
onready var player_hp_text = $HUD/BattleOptions/HealthBar/HealthLabel
onready var player_hp_bar_start = player_hp_bar.position.x

func _ready():
  hide_everything()

func hide_everything():
  visible = false
  $Background.visible = false
  
  for child in $HUD.get_children():
    print(child.name)
    if "visible" in child:
      child.visible = false

func show_everything():
  visible = true
  $Background.visible = true

  for child in $HUD.get_children():
    if "visible" in child:
      child.visible = true
  $HUD/DieInstantly.visible = G.debug
  $HUD/LoseInstantly.visible = G.debug
  
func start_battle():
  show_everything()
  
  # Spawn player
  var player_target = player.position
  player.position = Vector2(1000, 400)
  turn_queue.append(player)
  slide_in(player, player.position, player_target)
  
  targeting_index = 0
  
  var enemy_target = enemy.position
  enemy.position = Vector2(-100, 400)
  turn_queue.append(enemy)
  enemies.append(enemy)
  slide_in(enemy, enemy.position, enemy_target)

  start_turn()

func end_battle():
  # TODO: queue_free all enemies that still exist etc
  
  if minigame != null:
    minigame.queue_free()
  hide_everything()
  G.end_battle()

func _process(delta):
  if not G.in_battle:
    return
    
  player_hp_text.text = str(max(0, G.health))
  player_hp_bar.position.x = player_hp_bar_start - hp_bar_len + hp_bar_len * max(0, G.health) / G.max_health
  
  if is_in_minigame:
    return
  
  if Input.is_action_just_pressed("ui_left"):
    targeting_index = (targeting_index - 1) % len(enemies)
  elif Input.is_action_just_pressed("ui_right"):
    targeting_index = (targeting_index + 1) % len(enemies)
  
  var targeted_enemy = enemies[targeting_index]
  targeting_marker.position = targeted_enemy.position + 100*Vector2.UP + targeted_enemy.sprite.get_rect().size.x*Vector2.LEFT
  
  for ent in movement_queue.keys():
    var src = movement_queue[ent][0]
    var dest = movement_queue[ent][1]
    var s = ent.position.distance_to(dest)/src.distance_to(dest)
    
    ent.position += 10000*ease(s, 1)*delta*(dest - src).normalized()
    if ent.position.distance_to(dest) < 10:
      if len(movement_queue[ent]) == 2:
        movement_queue.erase(ent)
      else:
        movement_queue[ent].remove(0)
    
func take_action(action):
  var actor = turn_queue[0]
  var target = enemies[targeting_index] if actor == player else player
  
  print("%s used [Action %s] on %s." % [actor.get_name(), action, target.get_name()])
  if action == ACTIONS.insult:
    if actor == player:
      start_minigame()
    else:
      swipe(actor, player)
      G.health -= 5 # TODO vary the damage
      if G.health <= 0:
        end_battle()
      end_turn()
  elif action == ACTIONS.cry:
    G.health += 5 # TODO vary the healing
    end_turn()
  else: 
    print("boohoo")
  
func start_minigame():
  minigame = minigame_tscn.instance()
  add_child(minigame)
  is_in_minigame = true
  
  battle_ui.visible = false
  targeting_marker.visible = false

  minigame.connect("attack_landed", self, "minigame_damage")
  minigame.connect("minigame_over", self, "minigame_over")
  minigame.run_game(["everyone", "that", "gets", "close", "to", "you", "leaves"], [0, 2, 3, 6], 0.5, 0.4, 1, 4)
  
func minigame_over(): 
  if not minigame:
    return
  minigame.queue_free()
  is_in_minigame = false
  end_turn()
   
func minigame_damage():
  enemies[0].take_damage(500 if G.debug else 5)
  
  var all_dead = true
  
  for e in enemies:
    if not e.is_dead(): 
      all_dead = false
  
  if all_dead:
    end_battle()
   
func start_turn():
  var acting_entity = turn_queue[0] 
  print("It's %s's turn!" % acting_entity.get_name())
  if acting_entity == player: 
    battle_ui.visible = true
    targeting_marker.visible = true
  else: 
    battle_ui.visible = false
    targeting_marker.visible = false
    yield(get_tree().create_timer(2),"timeout") 
    take_action(ACTIONS.insult)

  
func end_turn():
  var was_acting = turn_queue[0]
  turn_queue.remove(0)
  turn_queue.append(was_acting)
  print("%s's turn has ended." % was_acting.get_name())

  start_turn()

func slide_in(entity, start, end):
  movement_queue[entity] = [start, end]
  
func swipe(entity, target):
  movement_queue[entity] = [entity.position, entity.position + 0.9*(target.position-entity.position), entity.position]


func _on_Button_pressed():
  end_battle()

func _on_LoseInstantly_pressed():
  G.health = -10
  end_battle()
