extends StaticBody2D
class_name Npc

export(String) var dialog = []
export var interaction_name = "Steve"
export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

func _on_InteractionMarker_on_interact():
  print("Start dlg")
  G.dialog().start(dialog)
