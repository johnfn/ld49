extends Node2D

export(preload("res://Globals.gd").ENEMIES) var enemy_type

func _on_InteractionMarker_on_interact():
  Enemies.info()[enemy_type].dialog.call_func()
