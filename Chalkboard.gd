extends Node2D

export(G.ENEMIES) var enemy_type = G.ENEMIES.Chalkboard

func _on_InteractionMarker_on_interact():
  Enemies.info()[enemy_type].dialog.call_func()
