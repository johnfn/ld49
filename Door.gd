extends StaticBody2D

onready var collision = $CollisionShape2D
onready var light_occluder = $LightOccluder2D

var interaction_name = "Door"
var open = false

func _ready():
  pass # Replace with function body.

func interact():
  open = not open
  collision.disabled = not collision.disabled
  modulate = Color(1, 1, 1, 0.2 if open else 1.0) 
  
  if open:
    remove_child(light_occluder)
  else:
    add_child(light_occluder)
