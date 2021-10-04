extends Node2D

var debug = OS.get_environment("USER") == "johnfn" || false

enum PauseMode {
  None = 0,
  Dialog = 1,
  Cinematic = 2,
}

enum InventoryItem {
  None,
  HallPass,
  SchoolFiles,
  TrueEnlightenment,
  PlusStr,
  PlusDef,
}

var inventory_contents = [
  InventoryItem.PlusDef,
#  InventoryItem.TrueEnlightenment,
] if debug else []

var inventory_text = {
  InventoryItem.HallPass: { "name": "HALL PASS", "desc": "with this you can go anywhere your heart desires", },
  InventoryItem.SchoolFiles: { "name": "TIMMY'S SCHOOL FILES", "desc": "wow things are going poorly for you", },
  InventoryItem.TrueEnlightenment: { "name": "TRUE ENLIGHTENMENT", "desc": "levels of anger known only to the gods allow you to GET ANGRY, even at inanimate objects", },
  InventoryItem.PlusStr: { "name": "PLUS STR", "desc": "just holding this makes you feel stronger", },
  InventoryItem.PlusDef: { "name": "PLUS DEF", "desc": "this makes your skin feel a bit tougher" },
}

onready var cinematics = $"/root/Main/Cinematics"

onready var battle_scene = $"/root/Main/BattleScene"

func inventory():
  return $"/root/Main/Hud/Inventory"

func player() -> Node2D:
  var player: Node2D = $"/root/Main/GameObjects/Player"
  
  return player

func hud():
  return $"/root/Main/Hud"

func dialog() -> Dialog:
  var d: Dialog = $"/root/Main/Hud/Dialog"
  return d

func camera() -> Camera2D:
  var camera: Camera2D = $"/root/Main/MainCamera"
  
  return camera

func battle_camera() -> Camera2D:
  var camera: Camera2D = $"/root/Main/BattleCamera"
  
  return camera
  
func has_true_enlightenment() -> bool:
  return inventory_contents.has(InventoryItem.TrueEnlightenment)

func has_hallpass() -> bool:
  return inventory_contents.has(InventoryItem.HallPass)

enum ENEMIES {
  Steve,
  Gteve,
  Wastebasket,
  MissTrunchbull,
  Door,
  Poster,
  Clock,
  Clock2,
  Chalkboard,
  Chalkboard2,
  Tombstone,
  TeacherPoster,
  TeacherClock,
  TeacherRug,
  PrincipalPike,
  SchoolFiles,
  TheGame,
  Credits,
  SchoolDoors,
  LoungeDoor,
  MichaelwaveOven,
  Stapler,
  ClassroomTrash,
  Recycling,
  PrincipalDesk,
  PrincipalPoster,
  Student1,
  Student2,
  Student3,
  Student4,
  Student5,
  Student6,
  ImageNotFound,
  Locker,
  Desk,
}

var attack = 50 if debug else 5
var healing = 7
var health = 20
var max_health = 20
var interactables: Array = []
var mode = PauseMode.None

var xp = 0
var level_xp = [20, 60, 140, 300, 600]

var in_battle = false
var battling_against: Array = []

func get_level():
  for x in range(len(level_xp)):
    if level_xp[x] > xp:
      return x + 1
  return 15

func next_level_xp():
  for next_xp in level_xp:
    if next_xp > xp:
      return next_xp
  
  # thonk
  return 9999999999

func gain_xp(amount: int, also_gained_item: bool):
  var old_level = get_level()
  
  xp += amount
  
  yield(get_tree(), "idle_frame")
  
  if old_level != get_level():
    
    yield(cinematics.gain_level(get_level(), amount, also_gained_item), "completed")
#  else: 
#    yield(cinematics.gain_xp(amount), "completed")

func handle_death():
  end_battle_cleanup()
  
  yield(cinematics.death(), "completed")

func end_battle_cleanup():
  G.camera().current = true
  
  G.in_battle = false
  G.battling_against = []
  G.battle_scene.visible = false

func fanfare_and_then_resume():
  Music.play_audio(Music.victory)
  
  yield(get_tree().create_timer(5), "timeout")
  
  Music.play_audio(Music.overworld_theme2 if has_true_enlightenment() else Music.overworld_theme)
    
func end_battle():
  yield(get_tree(), "idle_frame")
  
  if G.battling_against.size() == 0:
    return
  
  

  var first = battling_against[0]
  var type = first.enemy_type
  
  if G.health <= 0:
    handle_death()
    Music.play_audio(Music.overworld_theme2 if has_true_enlightenment() else Music.overworld_theme)
    return
  
  fanfare_and_then_resume()
  
  var items_gotten = []
  var total_xp = 0
  
  for enemy in G.battling_against:
    var info = Enemies.info()[enemy.enemy_type]
    
    total_xp += info.xp
    
    if info.drop != InventoryItem.None:
      inventory_contents.push_back(info.drop)
      
      if items_gotten.size() == 0:
        items_gotten.push_back(info.drop)
  
  var en = G.battling_against[0]
  var t = load("res://Tombstone.tscn").instance()
  en.get_parent().add_child(t)
  en.get_parent().move_child(t, en.get_index())
  t.position = en.position
  
  for enemy in G.battling_against:
    en.queue_free()
  
  yield(gain_xp(total_xp, items_gotten.size() > 0), "completed")

  end_battle_cleanup()
  
  if items_gotten.size() > 0:
    yield(cinematics.get_inventory_item(G.inventory_text[items_gotten[0]]["name"]), "completed")

func start_battle(battling_against: Array):
  if battling_against.size() == 0:
    print("WTF! some weird bug")
    return
  
  Music.play_audio(Music.battle_theme)
  
  var first = battling_against[0]
  var type = first.enemy_type
  
  var parent = G.battle_scene.get_parent()
  var index = G.battle_scene.get_index()
  var name = G.battle_scene.name
  
  G.battle_scene.dead = true
  G.battle_scene.queue_free()
  
  var new_battle = preload("res://Battle.tscn").instance()
  new_battle.name = name
  G.battle_scene = new_battle
  parent.add_child(new_battle)
  parent.move_child(new_battle, index)
  
  new_battle.position = camera().position - Vector2(1024, 600) / 2
  
  G.in_battle = true
  G.battling_against = battling_against
  G.battle_scene.visible = true
  G.battle_scene.start_battle()

var cry_tally = 0
var damage_tally = 0

var start_time
func start_clock():
  start_time = OS.get_ticks_msec()

func get_minutes():
  return int((OS.get_ticks_msec() - start_time) / 1000 / 60)

