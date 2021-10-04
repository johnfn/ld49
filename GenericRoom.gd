extends Node2D

var is_room = true
onready var bounds: Area2D = $RoomDimmer/Area2D
export var start_unlit : bool = true

func _ready():
  if not start_unlit:
    $RoomDimmer.setLit()
