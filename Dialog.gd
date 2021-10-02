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
  
  if next_dialog.begins_with("GET"):
    if next_dialog == "GET:COIN":
      dialog_text.add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
      next_dialog = "You pick up a coin!"
    else:
      dialog_text.add_color_override("font_color", Color(1, 1, 1, 1))
    
  dialog_text.text = next_dialog
  dialog_text.visible_characters = 0

func process_dialog():
  dialog_text.visible_characters += 1
  
  if dialog_text.percent_visible >= 1:
    if Input.is_action_just_pressed("action"):
      if next_dialogs.size() == 0:
        visible = false
        get_tree().paused = false
      else:
        get_next_dialog()

func start(dialogs: Array):
  visible = true
  tick = 0
  next_dialogs = [] + dialogs # copy dialog array
  get_next_dialog()

func _process(delta):
  if G.pause_mode == G.PauseMode.Dialog:
    process_dialog()
