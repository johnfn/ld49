extends Area2D

signal on_trigger

func _on_CinematicTrigger_body_entered(body):
  if body == G.player():
    emit_signal("on_trigger")
    queue_free()
