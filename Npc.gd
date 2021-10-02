extends StaticBody2D

export(String) var dialog = []
export var interaction_name = "Steve"
export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

func interact():
  # this stops is_action_just_pressed from being true 
  # and instantly advancing dialog
  yield(get_tree(), "idle_frame")
  
  get_tree().paused = true
  G.pause_mode = G.PauseMode.Dialog
  G.dialog().start(dialog)
