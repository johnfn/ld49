extends Node2D

export(G.ENEMIES) var enemy_type

func _on_InteractionMarker_on_interact():
  print(enemy_type)
  Enemies.info()[enemy_type].dialog.call_func()
