extends StaticBody2D
class_name Npc

export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

func _on_InteractionMarker_on_interact():
  Enemies.info()[enemy_type].dialog.call_func()
