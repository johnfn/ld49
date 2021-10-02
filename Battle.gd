extends Node2D

onready var player = $'Player'
onready var monster = $'Monster'
var currently_acting

# Called when the node enters the scene tree for the first time.
func _ready():
  currently_acting = player  

func take_turn():
  currently_acting = player if currently_acting == monster else monster

