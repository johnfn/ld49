extends Node2D
class_name BattleScene

onready var insult_button = $HUD/BattleOptions/InsultButton
onready var cry_button = $HUD/BattleOptions/CryButton
onready var battle_ui = $'HUD/BattleOptions'

var minigame
var minigame_tscn = load("res://InsultMinigame.tscn") 
var is_in_minigame = false
var is_player_turn
var dead = false

var hp_padding = 10
var hp_bar_len = 143
var enemy_hp_bar_len = 273
onready var player_hp_bar = $HUD/BattleOptions/HealthBar/HealthSprite
onready var player_hp_text = $HUD/BattleOptions/HealthBar/HealthLabel
onready var enemy_hp_bar = $HUD/RightHalf/EnemyUi/HealthBar/HealthSprite
onready var enemy_hp_text = $HUD/RightHalf/EnemyUi/HealthBar/HealthLabel

onready var opening_bubble = $HUD/OpeningBubble
onready var opening_text = $HUD/OpeningBubble/OpeningText
onready var speech_bubble = $HUD/RightHalf/SpeechBubble
onready var speech_text = $HUD/RightHalf/SpeechBubble/SpeechText

var enemy_data
var enemy_hp
var enemy_damage
var enemy_line

var player_line

func _ready():
  hide_everything()

func hide_everything():
  visible = false
  $BlurEffect.visible = false
  
  for child in $HUD.get_children():
    if "visible" in child:
      child.visible = false
  for child in $HUD/RightHalf.get_children():
    if "visible" in child:
      child.visible = false

func show_everything():
  visible = true
  $BlurEffect.visible = true

  for child in $HUD.get_children():
    if "visible" in child:
      child.visible = true
  for child in $HUD/RightHalf.get_children():
    if "visible" in child:
      child.visible = true
  for child in $HUD/RightHalf/EnemyContainer.get_children():
    child.visible = false
  speech_bubble.visible = false
  $HUD/RightHalf/DieInstantly.visible = G.debug
  $HUD/RightHalf/LoseInstantly.visible = G.debug

func display_enemy(name):
  if name == "Miss Trunchbull":
    $HUD/RightHalf/EnemyContainer/Trunchbull.visible = true
  elif name == "Principal Pike":
    $HUD/RightHalf/EnemyContainer/Principal.visible = true
  elif name == "Image Not Found":
    $"HUD/RightHalf/EnemyContainer/404".visible = true
  elif name == "Michaelwave Oven":
    $HUD/RightHalf/EnemyContainer/MichaelwaveOven.visible = true
  elif name == "School Doors":
    $"HUD/RightHalf/EnemyContainer/SchoolDoors".visible = true
  elif name == "The Game":
    $"HUD/RightHalf/EnemyContainer/TheGame".visible = true
  else:
    $"HUD/RightHalf/EnemyContainer/404".visible = true

func start_battle():
  is_in_minigame = false
  is_player_turn = true
  insult_button.visible = true
  cry_button.visible = true
  enemy_data = Enemies.info()[G.battling_against[0].enemy_type]
  $HUD/RightHalf/EnemyUi/NameTag/EnemyName.text = enemy_data["name"]
  enemy_hp = enemy_data["health"]
  print("set enemy hp", enemy_hp)
  if "damage" in enemy_data:
    enemy_damage = enemy_data["damage"]
  else:
    enemy_damage = 5
  enemy_line = 0
  opening_text.text = enemy_data["intro"]
  
  player_line = 0
  
  $AnimationPlayer.play("SlideIn")
  show_everything()
  display_enemy(enemy_data["name"])
  
func end_battle():
  if minigame != null:
    minigame.queue_free()
    minigame = null
  
  var line = enemy_data["victory"]
  if G.health <= 0:
    line = enemy_data["defeat"]
  yield(display_line(line), "completed")
  yield(get_tree().create_timer(0.5), "timeout")
  hide_everything()
  $AnimationPlayer.play_backwards("SlideIn")
  yield(G.end_battle(), "completed")
  
  if enemy_data["name"] == "School Doors":
    yield(G.cinematics.run_game_cinematic(), "completed")
    return
    
  if enemy_data["name"] == "The Game":
    yield(G.cinematics.run_credits_cinematic(), "completed")
    return
  
  if enemy_data["name"] == "Credits":
    yield(G.cinematics.run_ending_cinematic(), "completed")
    return

func _process(delta):
  if not G.in_battle:
    return
  
  if dead:
    return
  
  player_hp_text.text = str(max(0, G.health))
  player_hp_bar.offset.x = hp_padding
  var unused = hp_bar_len * (1 - float(max(0, G.health)) / G.max_health)
  player_hp_bar.region_rect = Rect2(hp_padding + unused, 0, 205 - hp_padding - unused, 47)
  var perc = unused / hp_bar_len
  if perc < 0.5:
    player_hp_bar.modulate = Color("63dc84")
  elif perc < 0.75:
    player_hp_bar.modulate = Color("ebcd46")
  else:
    player_hp_bar.modulate = Color("eb5546")
  
  enemy_hp_text.text = str(max(0, enemy_hp))
  enemy_hp_bar.offset.x = hp_padding
  unused = enemy_hp_bar_len * (1 - float(max(0, enemy_hp)) / enemy_data["health"])

  enemy_hp_bar.region_rect = Rect2(hp_padding + unused, 0, 330 - hp_padding - unused, 47)
  perc = unused / enemy_hp_bar_len
  if perc < 0.5:
    enemy_hp_bar.modulate = Color("63dc84")
  elif perc < 0.75:
    enemy_hp_bar.modulate = Color("ebcd46")
  else:
    enemy_hp_bar.modulate = Color("eb5546")
  
func start_minigame():
  minigame = minigame_tscn.instance()
  add_child(minigame)
  is_in_minigame = true
  
  insult_button.visible = false
  cry_button.visible = false

  minigame.connect("attack_landed", self, "minigame_damage")
  minigame.connect("minigame_over", self, "minigame_over")
  
  var line = enemy_data["playerLines"][player_line]
  var key_words = enemy_data["keyWords"][player_line]
  player_line = (player_line + 1) % len(enemy_data["playerLines"])
  var player_words = line.split(" ")
  var key_indices = []
  var key_i = 0
  for i in range(len(player_words)):
    if player_words[i] == key_words[key_i]:
      key_indices.append(i)
      key_i += 1
      if key_i >= len(key_words):
        break
  assert(len(key_words) == len(key_indices)) # TODO remove before shipping, leave until then to verify data
  
  var speed = enemy_data["speed"] if "speed" in enemy_data else 1
  var badspawn = enemy_data["bad_spawn_chance"] if "bad_spawn_chance" in enemy_data else 0.4
  var spawn_time = enemy_data["spawn_time"] if "spawn_time" in enemy_data else 1
  minigame.run_game(player_words, key_indices, speed, badspawn, spawn_time, 4)

func minigame_over(): 
  if not minigame:
    return
  minigame.queue_free()
  minigame = null
  is_in_minigame = false
  if enemy_hp > 0:
    enemy_attack()

func anim_damage_shake(target):
  var initial_pos = target.rect_position
  
  for x in range(5):
    target.rect_position = initial_pos + Vector2(randi() % 20, 0)
    
    for y in range(3):
      yield(get_tree(), "idle_frame")
  
  target.rect_position = initial_pos


func anim_damage_shake_pos(target):
  var initial_pos = target.position
  
  for x in range(5):
    target.position = initial_pos + Vector2(randi() % 20, 0)
    
    for y in range(3):
      yield(get_tree(), "idle_frame")
  
  target.position = initial_pos

func minigame_damage():
  enemy_hp = max(0, enemy_hp - G.attack)
  Music.right.play()
  anim_damage_shake($HUD/RightHalf/EnemyContainer)
  
  if enemy_hp == 0:
    minigame_over()
    end_battle()

func enemy_attack():
  var line = enemy_data["enemyLines"][enemy_line]
  enemy_line = (enemy_line + 1) % len(enemy_data["enemyLines"])
  yield(display_line(line), "completed")
  
  anim_damage_shake_pos($Player)
  
  G.health = max(0, G.health - enemy_damage)
  G.damage_tally += enemy_damage
  is_player_turn = true
  insult_button.visible = true
  cry_button.visible = true
  if G.health == 0:
    end_battle()

func display_line(line):
  if "<minutes>" in line:
    line.replace("<minutes>", G.get_minutes())
  if "<cry>" in line:
    line.replace("<cry>", G.cry_tally)
  if "<damage>" in line:
    line.replace("<damage>", G.damage_tally)
    
  speech_bubble.visible = true
  speech_text.text = ""
  
  var tick = 0
  for ch in line:
    tick += 1
    speech_text.text += ch
    
    if tick % 2 == 0:
      Music.play_tick_for(enemy_data.name)
    yield(get_tree(), "idle_frame")
  
  yield(get_tree().create_timer(1), "timeout")

func _on_Button_pressed():
  end_battle()

func _on_LoseInstantly_pressed():
  G.health = -10
  end_battle()

func on_insult_pressed():
  if not insult_button.visible:
    return
  opening_bubble.visible = false
  speech_bubble.visible = false
  is_player_turn = false
  insult_button.visible = false
  cry_button.visible = false
  start_minigame()

func on_cry_pressed():
  if not cry_button.visible:
    return
  opening_bubble.visible = false
  speech_bubble.visible = false
  is_player_turn = false
  insult_button.visible = false
  cry_button.visible = false
  G.health = min(G.max_health, G.health + G.healing)
  G.cry_tally += 1
  enemy_attack()


func _on_InsultButton_mouse_entered():
  $HUD/BattleOptions/InsultButton.modulate = Color(0.95, 0.95, .95, 1.0)

func _on_InsultButton_mouse_exited():
  $HUD/BattleOptions/InsultButton.modulate = Color(1.0, 1.0, 1.0, 1.0)

func _on_CryButton_mouse_entered():
  $HUD/BattleOptions/CryButton.modulate = Color(0.95, 0.95, .95, 1.0)

func _on_CryButton_mouse_exited():
  $HUD/BattleOptions/CryButton.modulate = Color(1.0, 1.0, 1.0, 1.0)
