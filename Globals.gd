extends Node2D

enum PauseMode {
  None = 0,
  Dialog = 1
}

onready var player = $"/root/Main/Player"
onready var hud = $"/root/Main/Hud"
onready var dialog: Dialog = $"/root/Main/Hud/Dialog"
var health = 20
var max_health = 20
var interactables: Array = []
var mode = PauseMode.None
