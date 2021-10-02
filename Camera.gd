extends Camera2D

onready var player = $"/root/Main/Player"

func _ready():
  pass

func _process(delta):
  position.x = player.position.x
  position.y = player.position.y
