extends Node2D
class_name BattleScene

enum ACTIONS {insult, cry}

export var enemy_pos = Vector2(700, 200)
export var player_pos = Vector2(200, 400)

var turn_queue = []
var player
var enemies = []
var targeting_index
onready var targeting_marker = $'HUD/TargetingMarker'

onready var battle_ui = $'HUD/BattleOptions'

var player_tscn = load("res://BattlePlayer.tscn") 
var enemy_to_tscn = {
  G.ENEMIES.Steve: load("res://BattleEnemy.tscn")  
 } 

# Called when the node enters the scene tree for the first time.
func _ready():
  # Spawn player
  player = player_tscn.instance()
  add_child(player)
  turn_queue.append(player)
  
  # Spawn enemies
  var num_enemies = len(G.battling_against)
  var offset = Vector2(200,100)/num_enemies
  for i in G.battling_against.size():
    var enemy_type = G.battling_against[i]
    var enemy = enemy_to_tscn[enemy_type].instance()
    add_child(enemy)
    enemy.position = enemy_pos + offset*(i - ((num_enemies-1)/2))
    enemies.append(enemy)
    turn_queue.append(enemy)
  
  start_turn()

func _process(delta):
  if Input.is_action_just_pressed("ui_left"):
    targeting_index = (targeting_index - 1) % len(enemies)
  elif Input.is_action_just_pressed("ui_right"):
    targeting_index = (targeting_index + 1) % len(enemies)
  
  var targeted_enemy = enemies[targeting_index]
  targeting_marker.position = targeted_enemy.position + 100*Vector2.UP + targeted_enemy.sprite.get_rect().size.x*Vector2.LEFT
    
func take_action(action):
  var acting_entity = turn_queue[0]
  acting_entity.take_action(action, enemies[targeting_index])
  end_turn()
  

func start_turn():
  var acting_entity = turn_queue[0]
  print("It's %s's turn!" % acting_entity.get_name())
  if acting_entity.get('is_player'): 
    battle_ui.visible = true
    targeting_marker.visible = true
    targeting_index = 0
  else: 
    battle_ui.visible = false
    targeting_marker.visible = false
    yield(get_tree().create_timer(1.5),"timeout") 
    acting_entity.take_action(ACTIONS.insult, player)
    end_turn()
  
func end_turn():
  var was_acting = turn_queue[0]
  print("%s's turn has ended." % was_acting.get_name())
  turn_queue.remove(0)
  turn_queue.append(was_acting)

  start_turn()
