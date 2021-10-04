extends CanvasLayer

onready var screen_fade = $ScreenFade
onready var overlay_text: Label = $OverlayText
onready var press_z_to_continue: Label = $PressZToContinue
onready var animation_player = $AnimationPlayer
onready var item_get = $ItemGet

func start_cinematic():
  get_tree().paused = true
  G.mode = G.PauseMode.Cinematic

func end_cinematic():
  get_tree().paused = false
  G.mode = G.PauseMode.None

func insta_go_to_black():
  screen_fade.modulate = Color(1.0, 1.0, 1.0, 1.0)
  screen_fade.visible = true

func insta_go_to_semiblack():
  screen_fade.modulate = Color(0.5, 0.5, 0.5, 0.5)
  screen_fade.visible = true

func fade_from_black_timed():
  screen_fade.visible = true
  
  for x in range(30, 0, -1):
    screen_fade.modulate = Color(1, 1, 1, x / 10.0)
    yield(get_tree(), "idle_frame")

func wait_for_z_press():
  while true:
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("action"):
      break

func show_press_z_to_continue():
  press_z_to_continue.visible = true
  
  for x in range(10):
    press_z_to_continue.modulate = Color(1, 1, 1, x / 10.0)
    yield(get_tree(), "idle_frame")
    
  press_z_to_continue.modulate = Color(1, 1, 1, 1)
  
  animation_player.play("PressXToContinue")
  
  wait_for_z_press()
  
  yield(get_tree(), "idle_frame")
  hide_press_z_to_continue()

func hide_press_z_to_continue():
  press_z_to_continue.visible = false

func write_overlay_text(text: String):
  hide_press_z_to_continue()
  
  overlay_text.visible = true
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

func snap_camera():
  G.camera().current = true
  G.camera().smoothing_enabled = false
  G.camera().position = G.player().position
  G.camera().force_update_transform()
  G.camera().smoothing_enabled = true

func _on_CinematicTrigger_on_trigger():
  if not G.debug:
    start_cinematic()
    insta_go_to_black()
    yield(write_overlay_text("One morning, Timmy arrived at Coolville High School to find that everyone was being a total d**k."), "completed")
    yield(write_overlay_text("Unfortunately, Timmy is part of everyone."), "completed")
    fade_from_black_timed()
    snap_camera()
    
    G.dialog().start([      
      { "speaker": "Miss Trunchbull", "dialog": "alright class i have an announcement to make", },
      { "speaker": "Miss Trunchbull", "dialog": "ive decided to send timmy to detention until he stops being a huge loser so say your last goodbyes now", },
    ])

var fade_frames = 30.0
var max_black = 0.88
func get_inventory_item(name: String):
  start_cinematic()
  snap_camera()
  
  item_get.show_item(name)
  item_get.visible = true
  screen_fade.visible = true
  
  for x in range(0, fade_frames):
    screen_fade.modulate = Color(1, 1, 1, x / (fade_frames - 1) * max_black)
    item_get.set_alpha(x / fade_frames)
    yield(get_tree(), "idle_frame")
  
  yield(wait_for_z_press(), "completed")
  
  for x in range(fade_frames, 0, -1):
    screen_fade.modulate = Color(1, 1, 1, (x - 1) / fade_frames * max_black)
    item_get.set_alpha(x / fade_frames)
    yield(get_tree(), "idle_frame")
    
  item_get.hide_item()
  screen_fade.visible = false
  item_get.visible = false
  end_cinematic()

func gain_level(level: int, amount_of_xp: int):
  start_cinematic()
  snap_camera()
  insta_go_to_semiblack()
  yield(write_overlay_text("You gained a level!"), "completed")
  yield(write_overlay_text("You are now level %d." % level), "completed")
  fade_from_black_timed()
  end_cinematic()

func gain_xp(amount: int):
  start_cinematic()
  snap_camera()
  insta_go_to_semiblack()
  yield(write_overlay_text("You gained %d experience!" % amount), "completed")
  yield(write_overlay_text("You're %d away from level %d" % [G.next_level_xp() - G.xp, G.get_level() + 1]), "completed")
  fade_from_black_timed()
  end_cinematic()
  
func _ready():
  for child in get_children():
    if "visible" in child:
      child.visible = false

func _process(delta):
  if G.mode != G.PauseMode.Cinematic:
    return
