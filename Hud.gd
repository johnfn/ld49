extends CanvasLayer

onready var inventory = $Inventory

func _ready():
  inventory.visible = false

func _process(delta):  
  if Input.is_action_just_pressed("inventory"):
    inventory.show()
