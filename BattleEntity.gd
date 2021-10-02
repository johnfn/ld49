extends Node2D
class_name BattleEntity

var sprite
var _sprite_texture: Resource = load("res://art/battle/battle_placeholder.png");
var _max_hp: int = 50;  
var _health = _max_hp

var _health_bar = load("res://HealthBar.tscn")
var health_bar_instance

onready var ACsTIONS = BattleScene.ACTIONS

func _init(sprite_texture, max_hp).():
  _sprite_texture = sprite_texture;
  _max_hp = _max_hp

# Called when the node enters the scene tree for the first time.
func _ready():
  sprite = Sprite.new()
  sprite.texture = _sprite_texture 
  add_child(sprite)
  
  health_bar_instance = _health_bar.instance() 
  add_child(health_bar_instance)
  health_bar_instance.position += Vector2(-health_bar_instance.color_rect.rect_size.x / 2, -sprite.get_rect().size.y)

func take_action(action: int, other: BattleEntity):  
  if action == ACTIONS.insult:
    attack(other, 5)
  elif action == ACTIONS.cry:
    heal(5)
  else: 
    print("boohoo")
  
func attack(target: BattleEntity, amount: int):
  target.take_damage(amount) 
  sprite.modulate = Color.red
  yield(get_tree().create_timer(0.1),"timeout") 
  sprite.modulate = Color.white
  
func heal(amount: int):
  set_hp(_health + amount)

func take_damage(amount: int):
  set_hp(_health - amount)

func set_hp(hp: int):
  health_bar_instance.set_hp(hp)
  _health = hp
  
func _on_InsultButton_pressed():
  print("hello")
