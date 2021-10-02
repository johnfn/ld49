extends Camera2D

onready var player = $"/root/Main/Player"

func _ready():
  pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
  position.x = player.position.x
  position.y = player.position.y
