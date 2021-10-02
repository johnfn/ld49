extends Node2D
class_name BattleEntity

var _sprite_texture: Resource = load("res://art/battle/battle_placeholder.png");
var _max_hp: int = 50;

var _health_bar = preload("res://HealthBar.tscn")

func _init(sprite_texture, max_hp).():
  _sprite_texture = sprite_texture;
  _max_hp = _max_hp

# Called when the node enters the scene tree for the first time.
func _ready():
  var sprite = Sprite.new()
  sprite.texture = _sprite_texture
  add_child(sprite)
  
  var health_bar_instance = _health_bar.instance()
  add_child(health_bar_instance)
  health_bar_instance.position += Vector2(-health_bar_instance.color_rect.rect_size.x / 2, -sprite.get_rect().size.y)

func attack(target: BattleEntity):
  pass
  
func heal():
  pass
