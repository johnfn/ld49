extends ColorRect
class_name Dialog

onready var speaker_name = $SpeakerName
onready var dialog_text = $DialogText

var tick = 0
var next_dialogs = ["Hello there"]

func _ready():
  visible = false

func get_next_dialog():
  var next_dialog: String = next_dialogs.pop_front()
  dialog_text.add_color_override("font_color", Color(1, 1, 1, 1))
  
  if next_dialog.begins_with("GET"):
    if next_dialog == "GET:COIN":
      dialog_text.add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
      next_dialog = "You pick up a coin!"
    
  dialog_text.text = next_dialog
  dialog_text.visible_characters = 0

func process_dialog():
  tick += 1
  
  if dialog_text.percent_visible >= 1:
    if Input.is_action_just_pressed("action"):

      if next_dialogs.size() == 0:
        visible = false
        get_tree().paused = false
      else:
        get_next_dialog()
  else:
    if Input.is_action_just_pressed("action"):
      dialog_text.percent_visible = 1
    else:
      if tick % 2 == 0:
        dialog_text.visible_characters += 1
  
func start(dialog_name: String):
  visible = true
  tick = 0
  next_dialogs = Dialogs.get_dialog(dialog_name)
  
  get_next_dialog()

func _process(delta):
  if G.pause_mode == G.PauseMode.Dialog:
    process_dialog()
