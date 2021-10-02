extends CanvasLayer

onready var interact_label = $InteractLabel
onready var angry_label = $AngryLabel
onready var inventory = $Inventory

func _ready():
  inventory.visible = false

func _process(delta):
  if G.interactables.size() > 0:
    var first = G.interactables[0]
    var name = first.interaction_name
    
    interact_label.text = "X: Insult " + name
    angry_label.text = "Z: Angry " + name
  else:
    interact_label.text = ""
    angry_label.text = ""
  
  if Input.is_action_just_pressed("inventory"):
    inventory.visible = true
