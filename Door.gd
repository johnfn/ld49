extends StaticBody2D

var interaction_name = "Open door"
var open = false

func _on_InteractionMarker_on_interact():
  open = not open
  $CollisionShape2D.disabled = not $CollisionShape2D.disabled
