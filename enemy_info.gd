extends Node

func info():
  return {
    G.ENEMIES.Steve: {
      "name": "Steve",
      "drop": G.InventoryItem.None,
      "interaction": "Talk to Steve",
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Gteve: {
      "name": "Gteve",
      "drop": G.InventoryItem.None,
      "interaction": "Talk to Gteve",
      "health": 25,
      "xp": 25,
      "is_inanimate": false,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Wastebasket: {
      "name": "Wastebasket",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect wastebasket",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.MissTrunchbull: {
      "name": "Miss Trunchbull",
      "interaction": "Talk to Miss Trunchbull",
      "drop": G.InventoryItem.HallPass,
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Poster: {
      "name": "Poster",
      "interaction": "Read poster",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Door: {
      "name": "Door",
      "interaction": "Open door",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Chalkboard: {
      "name": "Door",
      "interaction": "Read chalkboard",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "chalkboard_inspect")
    },
      
    G.ENEMIES.Clock: {
      "name": "Clock",
      "interaction": "Look at clock",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "clock_inspect")
    },
  }

func chalkboard_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a chalkboard", },
    { "speaker": "You", "dialog": "Miss Trunchbull is teaching us how to draw squiggly things with chalk", },
  ])

func clock_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a clock", },
    { "speaker": "You", "dialog": "It's not ticking", },
    { "speaker": "You", "dialog": "Probably because time here never seems to end", },
  ])
