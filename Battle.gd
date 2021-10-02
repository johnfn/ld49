extends Node2D
class_name BattleScene

onready var player = $'Player'
onready var monster = $'Monster'
onready var acting_entity = player
onready var idle_entity = monster
onready var battle_ui = $'HUD/BattleOptions'

enum ACTIONS {insult, cry}

# Called when the node enters the scene tree for the first time.
func _ready():
  acting_entity = player
  idle_entity = monster
  start_turn()

func take_action(action):
  player.take_action(action, monster)
  end_turn()
  
func start_turn():
  if acting_entity == player:
    battle_ui.visible = true
  else: 
    battle_ui.visible = false
    yield(get_tree().create_timer(1),"timeout") 
    monster.take_action(ACTIONS.insult, player)
    end_turn()
  
func end_turn():
  if acting_entity == player:
    acting_entity = monster
    idle_entity = player
  else:
    acting_entity = player
    idle_entity = monster
  start_turn()
 
func is_turn(actor):
  return acting_entity == actor   
