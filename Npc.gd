extends StaticBody2D
class_name Npc

export(String) var dialog = []
export var interaction_name = "Steve"
export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

func interact():
  G.dialog().start(dialog)
