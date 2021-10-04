extends Node2D
class_name BattleEntity

var _sprite_texture: Resource = load("res://art/battle/battle_placeholder.png");
var _sprite_material = load("res://shaders/sprite_material.tres")

var damage_label_tscn = load("res://DamageLabel.tscn")
var _max_hp: int = 50;  
var _health = _max_hp

onready var health_bar = $HealthBar

onready var ACTIONS = BattleScene.ACTIONS
onready var sprite = $Sprite

func _init(sprite_texture, max_hp).():
  _sprite_texture = sprite_texture;
  _max_hp = _max_hp

# Called when the node enters the scene tree for the first time.
func _ready():
  sprite.set_texture(_sprite_texture)
  
func attack(target: BattleEntity, amount: int):
  target.take_damage(amount) 
  yield(get_tree().create_timer(0.1),"timeout") 
  
func heal(amount: int):
  set_hp(_health + amount)

func take_damage(amount: int):
  set_hp(_health - amount)
  sprite.modulate = Color.red
  var label = damage_label_tscn.instance()
  add_child(label)
  label.position = self.position
  label.spawn(amount)
  yield(get_tree().create_timer(0.1),"timeout")
  sprite.modulate = Color.white
 
  
func set_hp(hp: int):
  health_bar.set_hp(hp)
  _health = hp

func is_dead():
  return _health <= 0
