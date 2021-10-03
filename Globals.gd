extends Node2D

var debug = true

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
] if debug else []

var inventory_text = {
  InventoryItem.HallPass: { "name": "hall pass", "desc": "with this you can go anywhere your heart desires", },
  InventoryItem.SchoolFiles: { "name": "school files", "desc": "wow things are going poorly for you", },
  InventoryItem.TrueEnlightenment: { "name": "true enlightenment", "desc": "levels of anger known only to the gods allow you to GET ANGRY, even at inanimate objects", },
  InventoryItem.PlusStr: { "name": "plus str", "desc": "just holding this makes you feel stronger", },
  InventoryItem.PlusDef: { "name": "plus def", "desc": "this makes your skin feel a bit tougher" },
}

onready var cinematics = $"/root/Main/Cinematics"

func battle_scene() -> BattleScene:
  var b: BattleScene = $"/root/Main/BattleScene"
  
  return b

func inventory():
  return $"/root/Main/Hud/Inventory"

func player() -> Node2D:
  var player: Node2D = $"/root/Main/Player"
  
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

enum ENEMIES {
  Steve,
  Gteve,
}

var health = 20
var max_health = 20
var interactables: Array = []
var mode = PauseMode.None

var xp = 0
var level_xp = [20, 40, 80, 200, 500, 1000, 2500, 5000, 10000]

var in_battle = false
var battling_against: Array = [$"/root/Main/Steve", $"/root/Main/Gteve"]

func gain_xp(amount: int):
  xp += amount

func next_level_xp():
  for next_xp in level_xp:
    if next_xp > xp:
      return next_xp
  
  # thonk
  return 9999999999

func end_battle():
  var items_gotten = []
  
  for enemy in G.battling_against:
    if enemy.drop_type != InventoryItem.None:
      inventory_contents.push_back(enemy.drop_type)
      
      if items_gotten.size() == 0:
        items_gotten.push_back(enemy.drop_type)
  
  for enemy in G.battling_against:
    enemy.queue_free()  
  
  if items_gotten.size() > 0:
    yield(cinematics.get_inventory_item(G.inventory_text[items_gotten[0]]["name"]), "completed")
  
  G.camera().current = true
  
  G.in_battle = false
  G.battling_against = []
  G.battle_scene().visible = false

func start_battle(battling_against: Array):
  G.battle_camera().current = true
  
  G.in_battle = true
  G.battling_against = battling_against
  G.battle_scene().visible = true
  G.battle_scene().start_battle()
