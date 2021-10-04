tool
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
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "steve_talk"),
      "walks": true,
    },
    
    G.ENEMIES.Gteve: {
      "name": "Gteve",
      "drop": G.InventoryItem.None,
      "interaction": "Talk to Gteve",
      "health": 25,
      "xp": 25,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "gteve_talk"),
      "walks": true,
    },
    
    G.ENEMIES.Wastebasket: {
      "name": "Wastebasket",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect wastebasket",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "wastebasket_inspect"),
    },
    
    G.ENEMIES.MissTrunchbull: {
      "name": "Miss Trunchbull",
      "interaction": "Talk to Miss Trunchbull",
      "drop": G.InventoryItem.HallPass,
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Poster: {
      "name": "Poster",
      "interaction": "Read poster",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Door: {
      "name": "Door",
      "interaction": "Open door",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
    },
    
    G.ENEMIES.Chalkboard: {
      "name": "Chalkboard",
      "interaction": "Read chalkboard",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "chalkboard_inspect"),
      "can_ever_fight": false
    },

    G.ENEMIES.Chalkboard2: {
      "name": "Chalkboard",
      "interaction": "Read chalkboard",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "chalkboard_inspect_2"),
      "can_ever_fight": false
    },

    G.ENEMIES.Clock: {
      "name": "Clock",
      "interaction": "Look at clock",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "clock_inspect"),
      "can_ever_fight": false
    },

    G.ENEMIES.Clock2: {
      "name": "Clock",
      "interaction": "Look at clock",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "clock_inspect_2"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Tombstone: {
      "name": "Tombstone",
      "interaction": "Read tombstone",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "tombstone_inspect"),
      "can_ever_fight": false
    },

    
    G.ENEMIES.TeacherPoster: {
      "name": "Teacher's poster",
      "interaction": "Read poster",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "teacher_poster_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.TeacherClock: {
      "name": "Clock",
      "interaction": "Inspect clock",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "teacher_clock_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.TeacherRug: {
      "name": "Rug",
      "interaction": "Inspect rug",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "teacher_rug_inspect"),
      "can_ever_fight": false
    },
  }

func chalkboard_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a chalkboard", },
    { "speaker": "You", "dialog": "Miss Trunchbull is teaching us how to draw squiggly things in her art class", },
  ])

func steve_talk():
  G.dialog().start([      
    { "speaker": "Steve", "dialog": "Hey, I'm Steve", },
    { "speaker": "You", "dialog": "Ok", },
  ])

func gteve_talk():
  G.dialog().start([      
    { "speaker": "Gteve", "dialog": "Hey, I'm Gteve. Steve's my brother", },
    { "speaker": "You", "dialog": "...wtf?", },
  ])

func chalkboard_inspect_2():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a chalkboard", },
    { "speaker": "You", "dialog": "Mr Mathews is teaching us the basics of how to use a piece of chalk to create a line on a chalkboard", },
    { "speaker": "You", "dialog": ".............", },
    { "speaker": "You", "dialog": "This class is so stupid", },
  ])
  
func clock_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a clock", },
    { "speaker": "You", "dialog": "It's not ticking", },
    { "speaker": "You", "dialog": "Probably because time here never seems to end", },
  ])

func clock_inspect_2():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a clock", },
    { "speaker": "You", "dialog": "It's not ticking", },
    { "speaker": "You", "dialog": "What's wrong with all the stupid clocks in this stupid school", },
  ])

func tombstone_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a tombstone", },
    { "speaker": "You", "dialog": "It reads: 'Here lies someone.'", },
    { "speaker": "You", "dialog": "Well, that's oddly nonspecific", },
  ])

var first = true
func wastebasket_inspect():
  if first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "You", "dialog": "This is a wastebin.", },
        { "speaker": "You", "dialog": "You look inside...", },
        { "speaker": "You", "dialog": "Hey, a coin!", },
        { "speaker": "You", "dialog": "GET:COIN", },
      ]
    )
    
    return
    
  G.dialog().start([ 
    { "speaker": "You", "dialog": "This is a wastebin.", },
    { "speaker": "You", "dialog": "You look inside...", },
    { "speaker": "You", "dialog": "There's nothing here." },
  ])

func teacher_poster_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a poster in the teacher's lounge", },
  ])
  
func teacher_clock_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "Ah, it's not just any clock", },
    { "speaker": "You", "dialog": "It's the clock in the *teacher's lounge*", },
    { "speaker": "You", "dialog": "Wait, it's exactly the same as all the other ones...", }, 
 ])

func teacher_rug_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's the rug in the teacher's lounge", },
    { "speaker": "You", "dialog": "This rug is legendary amongst kids in Coolvile High", },
  ])
