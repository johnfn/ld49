extends StaticBody2D

export(Array, String) var dialogs = []
export var interaction_name = "Steve"

func interact():
  get_tree().paused = true
  G.pause_mode = G.PauseMode.Dialog
  G.dialog().start(dialogs)
