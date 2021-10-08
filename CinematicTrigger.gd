extends Area2D

signal on_trigger

export var one_time_use = true

func _on_CinematicTrigger_body_entered(body):
  if body == G.player():
    emit_signal("on_trigger")
    if one_time_use:
      queue_free()
