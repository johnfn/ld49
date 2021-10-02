extends Node2D
class_name HealthBar

var _max_hp: int;
var _hp: int;

var MAX_HP_LENGTH_PX = 100;

onready var color_rect = $'ColorRect'

func _init(max_hp = 0).():
  _max_hp = max_hp;

func _ready():
  color_rect.rect_size = Vector2(MAX_HP_LENGTH_PX, 10) 

