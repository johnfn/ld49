extends ColorRect
class_name Dialog

onready var speaker_name = $SpeakerName
onready var dialog_text = $DialogText

var tick = 0
var next_dialogs = ["Hello there"]

func _ready():
  visible = false

func process_dialog():
  dialog_text.visible_characters += 1
  
  if dialog_text.percent_visible >= 1:
    if Input.is_action_just_pressed("action"):
      if next_dialogs.size() == 0:
        visible = false
        get_tree().paused = false
      else:
        dialog_text.text = next_dialogs.pop_front()
        dialog_text.visible_characters = 0

func start(dialogs: Array):
  visible = true
  tick = 0
  next_dialogs = [] + dialogs # copy dialog array
  dialog_text.text = next_dialogs.pop_front()
  dialog_text.visible_characters = 0

func _process(delta):
  if G.pause_mode == G.PauseMode.Dialog:
    process_dialog()
