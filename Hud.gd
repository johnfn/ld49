extends CanvasLayer

onready var interact_label = $InteractLabel
onready var angry_label = $AngryLabel
onready var inventory = $Inventory

func _ready():
  inventory.visible = false

func _process(delta):  
  if Input.is_action_just_pressed("inventory"):
    inventory.visible = true
