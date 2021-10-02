extends Node2D

enum PauseMode {
  None = 0,
  Dialog = 1,
  Cinematic = 2,
}

func inventory():
  return $"/root/Main/Hud/Inventory"

func player() -> Node2D:
  var player: Node2D = $"/root/Main/Player"
  
  return player

func hud():
  return $"/root/Main/Hud"

func dialog():
  return $"/root/Main/Hud/Dialog"

func camera() -> Camera2D:
  var camera: Camera2D = $"/root/Main/MainCamera"
  
  return camera

enum ENEMIES {
  Steve,
  Gteve,
 }

var health = 20
var max_health = 20
var interactables: Array = []
var mode = PauseMode.None


var xp = 0
var level_xp = [20, 40, 80, 200, 500, 1000, 2500, 5000, 10000]

var in_battle = false
var battling_against: Array = [$"/root/Main/Steve", $"/root/Main/Gteve"]

