extends Node2D
class_name BattleScene

enum ACTIONS {insult, cry}

onready var acting_entity
var turn_queue = []
var player

onready var battle_ui = $'HUD/BattleOptions'

var player_tscn = preload("res://BattlePlayer.tscn") 
var enemy_to_tscn = {
  G.ENEMIES.Steve: preload("res://BattleEnemy.tscn") 
 } 

# Called when the node enters the scene tree for the first time.
func _ready():
  # Spawn player
  player = player_tscn.instance()
  add_child(player)
  turn_queue.append(player)
  
  # Spawn enemies
  for enemy_type in G.battling_against:
    var enemy = enemy_to_tscn[enemy_type].instance()
    add_child(enemy)
    turn_queue.append(enemy)
  
  start_turn()

func take_action(action):
  var acting_entity = turn_queue[0]
  acting_entity.take_action(action, turn_queue[1])
  end_turn()
  

func start_turn():
  var acting_entity = turn_queue[0]
  
  if acting_entity.get('is_player'):
    battle_ui.visible = true
  else: 
    battle_ui.visible = false
    yield(get_tree().create_timer(1),"timeout") 
    acting_entity.take_action(ACTIONS.insult, player)
    end_turn()
  
func end_turn():
  var was_acting = turn_queue[0]
  turn_queue.remove(0)
  turn_queue.append(was_acting)

  start_turn()
