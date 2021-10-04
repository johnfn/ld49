extends ColorRect
class_name Dialog

onready var speaker_name = $SpeakerName
onready var dialog_text = $DialogText
onready var z_to_continue = $ZToContinue
onready var x_to_fight = $PressXPrompt

export var miss_trunchbull : NodePath
export var principal_pike : NodePath
export var school_doors : NodePath

var speaker_to_node = {
  "Miss Trunchbull":  miss_trunchbull,
  "Principal Pike":  principal_pike,
  "School Doors":  school_doors,
}

var tick = 0
var next_dialogs = ["Hello there"]
var is_forced_to_fight = false

func _ready():
  visible = false

func get_next_dialog():
  var next_dialog_obj = next_dialogs.pop_front()
  
  var next_dialog = next_dialog_obj["dialog"]
  var speaker = next_dialog_obj["speaker"]
  is_forced_to_fight = next_dialog_obj.has("forces_fight") and next_dialog_obj["forces_fight"]
  
#  dialog_text.add_color_override("font_color", Color(1, 1, 1, 1))
#
#  if next_dialog.begins_with("GET"):
#    if next_dialog == "GET:COIN":
#      dialog_text.add_color_override("font_color", Color(0.5, 0.5, 0.5, 1))
#      next_dialog = "You pick up a coin!"
  
  dialog_text.text = next_dialog
  dialog_text.visible_characters = 0 
  z_to_continue.visible = false
  x_to_fight.visible = false
  
  speaker_name.text = speaker

func stop_dialog():
  yield(get_tree(), "idle_frame")
  visible = false
  get_tree().paused = false
  G.mode = G.PauseMode.None
  z_to_continue.visible = false
  x_to_fight.visible = false

func process_dialog():
  tick += 1
  
  if dialog_text.percent_visible >= 1:
    if is_forced_to_fight:
      x_to_fight.visible = true
    else:
      z_to_continue.visible = true
    
    if not is_forced_to_fight and Input.is_action_just_pressed("action"):
      if next_dialogs.size() == 0:
        stop_dialog()
      else:
        get_next_dialog()
    elif is_forced_to_fight and Input.is_action_just_pressed("angry"):
      stop_dialog()
      G.start_battle([get_node(miss_trunchbull)])
  else:
    if Input.is_action_just_pressed("action"):
      dialog_text.percent_visible = 1
    else:
      if tick % 2 == 0:
        dialog_text.visible_characters += 1
  
func start(dialog_name_or_contents):
  # this stops is_action_just_pressed from being true 
  # and instantly advancing dialog
  yield(get_tree(), "idle_frame")
  get_tree().paused = true
  G.mode = G.PauseMode.Dialog
  visible = true
  tick = 0
  
  if typeof(dialog_name_or_contents) == TYPE_STRING:
    next_dialogs = Dialogs.get_dialog(dialog_name_or_contents)
  else:
    next_dialogs = dialog_name_or_contents
  
  get_next_dialog()

func _process(delta):
  if G.mode == G.PauseMode.Dialog:
    process_dialog()
