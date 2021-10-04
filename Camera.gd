extends Camera2D

func _ready():
  pass

func _process(delta):
  position.x = G.player().position.x
  position.y = G.player().position.y
