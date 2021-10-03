extends StaticBody2D

onready var collision = $CollisionShape2D
onready var light_occluder = $LightOccluder2D

var interaction_name = "Open door"
var open = false

func _on_InteractionMarker_on_interact():
  open = not open
  collision.disabled = not collision.disabled
  
  if open:
    remove_child(light_occluder)
  else:
    add_child(light_occluder)
