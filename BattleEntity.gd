extends Node2D
class_name BattleEntity

var _sprite_texture: Resource = load("res://art/battle/battle_placeholder.png");

onready var sprite = $Sprite

func _init(sprite_texture, max_hp).():
  _sprite_texture = sprite_texture;

func _ready():
  sprite.set_texture(_sprite_texture)
