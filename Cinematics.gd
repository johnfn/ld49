extends CanvasLayer

export var camera_target_exit : NodePath
export var camera_target_principal : NodePath
export var camera_target_principal_door : NodePath

onready var screen_fade = $ScreenFade
onready var overlay_text: Label = $OverlayText
onready var press_z_to_continue: Label = $PressZToContinue
onready var big_press_prompt: Label = $PressZPrompt
onready var animation_player = $AnimationPlayer
onready var item_get = $ItemGet

onready var school_files = $"/root/Main/GameObjects/PrincipalsOffice/RoomDimmer/Graphics/SchoolFiles"
onready var the_game = $"/root/Main/GameObjects/BigHallway/RoomDimmer/Graphics/TheGame"
onready var credits = $"/root/Main/GameObjects/BigHallway/RoomDimmer/Graphics/Credits"
onready var statsHud = $"/root/Main/Hud/StatsBox"

export(NodePath) var pike
export(NodePath) var pike_trigger

func start_cinematic():
  statsHud.visible = false
  get_tree().paused = true
  G.mode = G.PauseMode.Cinematic

func end_cinematic():
  statsHud.visible = true
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

func fade_to_black_timed(length = 90.0):
  screen_fade.visible = true
  
  for x in range(0, int(length)):
    screen_fade.modulate = Color(1, 1, 1, x / length)
    yield(get_tree(), "idle_frame")

func wait_for_z_press():
  while true:
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("action"):
      break

func wait_for_x_press():
  while true:
    yield(get_tree(), "idle_frame")
    
    if Input.is_action_just_pressed("angry"):
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

func write_overlay_text(text: String, clear = true, end_of_game = false):
  overlay_text.visible = true
  overlay_text.text = text
  overlay_text.percent_visible = 0.0
  
  while overlay_text.percent_visible < 1.0:
    overlay_text.visible_characters += 1
    
    yield(get_tree(), "idle_frame")
    yield(get_tree(), "idle_frame")
      
  big_press_prompt.visible = not end_of_game
  $End.visible = end_of_game
  overlay_text.percent_visible = 1.0
    
  yield(get_tree(), "idle_frame")
  
  if end_of_game:
    return
  
  yield(wait_for_z_press(), "completed")
  
  if clear:
    big_press_prompt.visible = false
    overlay_text.percent_visible = 0

func write_overlay_fight_text(text: String, prompt: String, node: Node2D):
  $PressXPrompt.text = prompt
  overlay_text.visible = true
  overlay_text.text = text
  overlay_text.percent_visible = 0.0
  
  while overlay_text.percent_visible < 1.0:
    overlay_text.visible_characters += 1
    
    yield(get_tree(), "idle_frame")
    yield(get_tree(), "idle_frame")
      
  $PressXPrompt.visible = true
  overlay_text.percent_visible = 1.0
    
  yield(get_tree(), "idle_frame")
  
  yield(wait_for_x_press(), "completed")
  
  $PressXPrompt.visible = false
  overlay_text.percent_visible = 0
  
  yield(fade_from_black_timed(), "completed")
  end_cinematic()
  snap_camera()

  G.start_battle([node])

func snap_camera():
  G.camera().current = true
  G.camera().smoothing_enabled = false
  G.camera().position = G.player().position
  G.camera().force_update_transform()
  G.camera().smoothing_enabled = true

func _on_CinematicTrigger_on_trigger(cinematic):
  if cinematic == "principal":
#    G.camera().cutscene_target = get_node(camera_target_principal).position
    run_principal_cinematic()
  elif cinematic == "principal door":
    start_cinematic()
    G.camera().cutscene_target = get_node(camera_target_principal_door).position
    G.dialog().start([{ "speaker": "You", "dialog": "the principals office... better be prepared", }])
  elif cinematic == "exit door":
    G.camera().cutscene_target = get_node(camera_target_exit).position
    start_cinematic()
    G.dialog().start([{ "speaker": "You", "dialog": "the school exit... if i managed to ditch, this terrible day would be over", }])


func run_principal_cinematic():
  start_cinematic()
  G.dialog().start([      
    { "speaker": "Principal Pike", "dialog": "sent to my office again eh timmy?", },
    { "speaker": "Principal Pike", "dialog": "i'm a man who solves problems now instead of later timmy", },
    { "speaker": "Principal Pike", "dialog": "and if i expel you i never have to see your face again", "forces_fight": true},
  ])

func run_trunchbull_cinematic():
  start_cinematic()
  insta_go_to_black()
  yield(write_overlay_text("One morning, Timmy arrived at Coolville High School to find that everyone was a total d**k."), "completed")
  yield(write_overlay_text("Unfortunately,\nTimmy is part of everyone."), "completed")
  fade_from_black_timed()
  snap_camera()
  
  G.dialog().start([      
    { "speaker": "Miss Trunchbull", "dialog": "alright class i have an announcement to make", },
    { "speaker": "Miss Trunchbull", "dialog": "i've decided to send timmy to detention until he stops being a huge loser, so say your last goodbyes now", },
    { "speaker": "Miss Trunchbull", "dialog": "wow no one even wants to say goodbye", },
    { "speaker": "Miss Trunchbull", "dialog": "this is the end of the line timmy", },
    { "speaker": "Miss Trunchbull", "dialog": "you're going to qualify for social security in detention timmy", "forces_fight": true},
  ])

func run_game_cinematic():
  start_cinematic()
  insta_go_to_black()
  G.player().position = Vector2(100000, 100000)
  G.player().visible = false
  yield(write_overlay_text("Timmy had earned his freedom from Coolville High, but what he really wanted..."), "completed")
  yield(write_overlay_fight_text("...was freedom from the system.", "Press X to GET ANGRY", the_game), "completed")

func run_credits_cinematic():
  start_cinematic()
  insta_go_to_black()
  yield(write_overlay_fight_text("But Timmy's fight wasn't over yet. There was one more thing to GET VERY ANGRY at...", "Press X to GET VERY ANGRY", credits), "completed")
  
func run_ending_cinematic():
  start_cinematic()
  insta_go_to_black()
  yield(write_overlay_text("As the game crumbled around him, Timmy tasted true freedom for the first time in his life."), "completed")
  yield(write_overlay_text("The flavor was disappointing.", true, true), "completed")
  

var fade_frames = 30.0
var max_black = 0.88
func get_inventory_item(name: String):
  start_cinematic()
  snap_camera()
  
  var forces_file_fight = name == "TIMMY'S SCHOOL FILES"
  
  item_get.show_item(name, forces_file_fight)
  item_get.visible = true
  var fade_in_fade = not screen_fade.visible
  screen_fade.visible = true
  
  for x in range(0, fade_frames):
    if fade_in_fade:
      screen_fade.modulate = Color(1, 1, 1, x / (fade_frames - 1) * max_black)
    item_get.set_alpha(x / fade_frames)
    yield(get_tree(), "idle_frame")
  
  if forces_file_fight:
    yield(wait_for_x_press(), "completed")
  else:
    yield(wait_for_z_press(), "completed")
  
  if name == "TRUE ENLIGHTENMENT":
    get_node(pike).queue_free()
    get_node(pike_trigger).queue_free()
    if not G.in_battle:
      Music.play_audio(Music.overworld_theme2)
  
  for x in range(fade_frames, 0, -1):
    screen_fade.modulate = Color(1, 1, 1, (x - 1) / fade_frames * max_black)
    item_get.set_alpha(x / fade_frames)
    yield(get_tree(), "idle_frame")
    
  item_get.hide_item()
  screen_fade.visible = false
  item_get.visible = false
  end_cinematic()
  
  if forces_file_fight:
    G.start_battle([school_files])

func death():
  Enemies.full_heal_exists = true
  
  start_cinematic()
  fade_to_black_timed()
  yield(write_overlay_text("You were insulted so hard you passed out!"), "completed")
  G.health = G.max_health
  G.player().position = $"/root/Main/GameObjects/Checkpoints".last_position
  G.player().visible = true
  yield(get_tree(), "idle_frame")
  fade_from_black_timed()
  end_cinematic()

func gain_level(level: int, amount_of_xp: int, also_gained_item: bool):
  start_cinematic()
  snap_camera()
  
  screen_fade.visible = true
  for x in range(0, fade_frames):
    screen_fade.modulate = Color(1, 1, 1, x / (fade_frames - 1) * max_black)
    yield(get_tree(), "idle_frame")
    
  var upgrade_desc
  if level == 2:
    upgrade_desc = "+10 HP"
    G.max_health += 10
    G.health += 10
  elif level == 3:
    upgrade_desc = "+5 HP, powerful tears"
    G.max_health += 5
    G.health += 5
    G.healing += 5
  elif level == 4:
    upgrade_desc = "+5 damage"
    G.attack += 5
  elif level == 5:
    upgrade_desc = "+20 HP"
    G.max_health += 20
    G.health += 20
  else:
    upgrade_desc = "Wait, how did you do that?"
  yield(write_overlay_text(("You gained a level!\nYou are now level %d.\n" % level) + upgrade_desc), "completed")
  if not also_gained_item:
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
  G.start_clock()
  for child in get_children():
    if "visible" in child:
      child.visible = false
      
  if not G.debug:
    run_trunchbull_cinematic()

func _process(delta):
  if G.mode != G.PauseMode.Cinematic:
    return
