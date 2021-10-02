extends CanvasLayer

onready var interact_label = $InteractLabel

func _ready():
  pass # Replace with function body.

func _process(delta):
  if G.interactables.size() > 0:
    var first = G.interactables[0]
    var name = first.interaction_name
    
    interact_label.text = "Insult " + name
  else:
    interact_label.text = ""
