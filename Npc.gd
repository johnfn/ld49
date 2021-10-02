extends StaticBody2D

export(Array, String) var dialogs = []
var interaction_name = "Steve"

func _ready():
  pass

func interact():
  get_tree().paused = true
  G.pause_mode = G.PauseMode.Dialog
  G.dialog().start(dialogs)
