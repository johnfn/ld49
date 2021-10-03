extends Node2D

func _on_Area2D_body_entered(body):
  if body == G.player():
    $Graphics.modulate = Color(1, 1, 1, 1)


func _on_Area2D_body_exited(body):
  if body == G.player():
    $Graphics.modulate = Color(1, 1, 1, 0.3)
