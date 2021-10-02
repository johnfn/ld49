extends CanvasLayer

onready var screen_fade = $ScreenFade
onready var overlay_text: Label = $OverlayText
onready var press_z_to_continue: Label = $PressZToContinue
onready var animation_player = $AnimationPlayer

func start_cinematic():
  get_tree().paused = true
  G.pause_mode = G.PauseMode.Cinematic

func insta_go_to_black():
  screen_fade.visible = true

func fade_from_black_timed():
  screen_fade.visible = true
  
  for x in range(30, 0, -1):
    screen_fade.modulate = Color(1, 1, 1, x / 10.0)
    yield(get_tree(), "idle_frame")

func show_press_z_to_continue():
  press_z_to_continue.visible = true
  
  for x in range(10):
    press_z_to_continue.modulate = Color(1, 1, 1, x / 10.0)
    yield(get_tree(), "idle_frame")
    
  press_z_to_continue.modulate = Color(1, 1, 1, 1)
  
  animation_player.play("PressXToContinue")
  
  while true:
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("action"):
      break
  
  yield(get_tree(), "idle_frame")
  hide_press_z_to_continue()

func hide_press_z_to_continue():
  press_z_to_continue.visible = false

func write_overlay_text(text: String):
  hide_press_z_to_continue()
  
  overlay_text.text = text
  overlay_text.percent_visible = 0.0
  
  while overlay_text.percent_visible < 1.0:
    overlay_text.visible_characters += 1
    
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("action"):
      break
      
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("action"):
      break
      
  overlay_text.percent_visible = 1.0
    
  yield(get_tree(), "idle_frame")
  
  yield(show_press_z_to_continue(), "completed")
  
  overlay_text.percent_visible = 0


func _on_CinematicTrigger_on_trigger():
  start_cinematic()
  insta_go_to_black()
  yield(write_overlay_text("One morning, Timmy arrived at Coolville High School to find that everyone was being a total d**k."), "completed")
  yield(write_overlay_text("Unfortunately, Timmy is part of everyone."), "completed")
  fade_from_black_timed()
  # snap_camera()
  
  G.dialog().start([      
    { "speaker": "Miss Trunchbull", "dialog": "alright class i have an announcement to make", },
    { "speaker": "Miss Trunchbull", "dialog": "ive decided to send timmy to detention until he stops being a huge loser so say your last goodbyes now", },
  ])
  
func _process(delta):
  if G.pause_mode != G.PauseMode.Cinematic:
    return
