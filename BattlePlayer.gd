extends "res://BattleEntity.gd"
class_name BattlePlayer

var is_player = true

export var sprite_texture: Resource = load("res://art/battle/mcbattle.png");
export var max_hp = G.max_health;

func _init().(sprite_texture, max_hp):
  pass 
  
