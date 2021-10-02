extends Node2D

enum PauseMode {
  None = 0,
  Dialog = 1
}

func inventory():
  return $"/root/Main/Hud/Inventory"

func player():
  return $"/root/Main/Player"

func hud():
  return $"/root/Main/Hud"

func dialog():
  return $"/root/Main/Hud/Dialog"

var health = 20
var max_health = 20
var interactables: Array = []
var mode = PauseMode.None
