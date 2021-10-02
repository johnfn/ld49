extends Node2D
class_name HealthBar

var _max_hp: int;
var _hp: int;

var MAX_HP_LENGTH_PX = 100;

onready var health_bar = $'Inner'
onready var border = $'Outer'

func _init(max_hp = 50).():
  _max_hp = max_hp;

func _ready():
  health_bar.rect_size = Vector2(MAX_HP_LENGTH_PX, 10) 
  border.rect_size = Vector2(MAX_HP_LENGTH_PX + 1, 10 + 1) 

func set_hp(hp: int):
  var length = hp * MAX_HP_LENGTH_PX / _max_hp
  _hp = hp
  health_bar.rect_size = Vector2(length, 10) 
 
