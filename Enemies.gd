tool
extends Node

func info():
  return {
    G.ENEMIES.Student1: {
      "name": "Student1",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student1_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Student2: {
      "name": "Student2",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student2_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Student6: {
      "name": "Student6",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student6_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Student3: {
      "name": "Student3",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student3_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Student4: {
      "name": "Student4",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student4_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Student5: {
      "name": "Student5",
      "drop": G.InventoryItem.None,
      "interaction": "Talk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "student5_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.PrincipalDesk: {
      "name": "Principal Desk",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect desk",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "principaldesk_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.PrincipalPoster: {
      "name": "Principal Poster",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect poster",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "principalposter_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.ClassroomTrash: {
      "name": "Wastebasket",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect wastebasket",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "classroomtrash_inspect"),
      "can_ever_fight": false
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
      "can_ever_fight": false
    },
    
    G.ENEMIES.Recycling: {
      "name": "Recycling",
      "drop": G.InventoryItem.None,
      "interaction": "Inspect recycling bin",
      "health": 5,
      "xp": 15,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "recycling_inspect"),
      "can_ever_fight": false
    },
    
    G.ENEMIES.Poster: {
      "name": "Poster",
      "interaction": "Read poster",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "can_ever_fight": false
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
    
    G.ENEMIES.Door: {
      "name": "Door",
      "interaction": "Open door",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "can_ever_fight": false,
    },
    
    #######################################################
    #                  Fightable Enemies                  #
    #######################################################
    
    G.ENEMIES.MissTrunchbull: {
      "name": "Miss Trunchbull",
      "interaction": "Talk to Miss Trunchbull",
      "drop": G.InventoryItem.HallPass,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "Miss Trunchbull GOT YOU ANGRY",
      "victory": "...just take this and get out of my sight...",
      "defeat": "i wonder if this building will still be around by the time your detention is over",
      "playerLines": [
        "the only thing you've taught me is that you're not worth listening to",
        "i recorded your class to help with my insomnia",
        "one of the world's famous unsolved problems is how you remain employed",
       ],
      "keyWords": [
        ["only", "taught", "not", "listening"],
        ["recorded", "your", "class", "insomnia"],
        ["world's", "famous", "unsolved", "employed"],
       ],
      "enemyLines": [
        "class clown isnt meant to be taken this literally timmy",
        "this is a more pitiful showing than your last exam",
        "i could only tell it was yours because it was illegible",
      ],
      "dialog": funcref(self, "trunchbull_talk"),
      
      "health": 25,
      "xp": 30,
      "damage": 5,
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.PrincipalPike: {
      "name": "Principal Pike",
      "interaction": "TODO",
      "drop": G.InventoryItem.SchoolFiles,
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "Principal Pike IS AIMED AT YOU",
      "victory": "only a few years until retirement...",
      "defeat": "another problem solved",
      "playerLines": [
        "you have no principles",
        "you're compensating for how powerless you are everywhere else",
        "i'm going home, you're going to a home",
       ],
      "keyWords": [
        ["you", "have", "no", "principles"],
        ["compensating", "for", "powerless", "everywhere"],
        ["you're", "going", "to", "a", "home"],
       ],
      "enemyLines": [
        "school was never a good fit for you anyways",
        "now you can go somewhere you fit in better, like prison",
        "remember that time you got sent here covered in glue",
      ],
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.SchoolFiles: {
      "name": "Timmy's School Files",
      "interaction": "TODO",
      "drop": G.InventoryItem.TrueEnlightenment,
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "Timmy's School Files GOT YOU RILED",
      "victory": '"Student is very persistent."',
      "defeat": '"Student is destined for failure."',
      "playerLines": [
        "your arguments are thin",
        "it's all the same to a shredder",
        "you're full of sheets",
       ],
      "keyWords": [
        ["your", "arguments", "are", "thin"],
        ["all", "the", "same", "to", "shredder"],
        ["you're", "full", "of", "sheets"],
       ],
      "enemyLines": [
        '"Strengths: Is able to read. If the words are short."',
        '"Weaknesses: Boring, stupid... Continues on pages 2-4."',
        '"Seems to have eaten a lot of glue as a child."',
      ],
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.Stapler: {
      "name": "A Stapler",
      "interaction": "TODO",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "A Stapler HAS YOU SEEING RED",
      "victory": "does making staplers feel bad make you feel good?",
      "defeat": "feel my two pronged wrath, loser",
      "playerLines": [
        "you remind me of clippy",
        "you are becoming increasingly irrelevant in modern society ",
        "initech proves you can't handle burns",
       ],
      "keyWords": [
        ["you", "remind", "me", "clippy"],
        ["you", "irrelevant", "modern", "society"],
        ["you", "can't", "handle", "burns"],
       ],
      "enemyLines": [
        "maybe with some staples you could hold your life together",
        "is that really the best line you can swing",
        "kids are a staple of my diet",
      ],
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.MichaelwaveOven: {
      "name": "Michaelwave Oven",
      "interaction": "TODO",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "Michaelwave Oven GOT YOU HEATED",
      "victory": "wow youre better at burning things than i am",
      "defeat": "*DING*",
      "playerLines": [
        "you don't deserve to be a named character",
        "you're as cold inside as you leave food",
        "everyone wishes you weren't so loud",
       ],
      "keyWords": [
        ["don't", "deserve", "named", "character"],
        ["cold", "inside", "as", "food"],
        ["everyone", "wishes", "weren't", "loud"],
       ],
      "enemyLines": [
        "who better than me to roast you",
        "im the only one who will show you warmth",
        "ill make your head spin",
      ],
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.LoungeDoor: {
      "name": "Teacher's Lounge Door",
      "interaction": "Inspect Lounge Doors",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "The Teacher's Lounge Door IS LOCKED IN YOUR SIGHTS",
      "victory": "i pray for the souls of doors everywhere",
      "defeat": "youre not ready for the teacher's lounge, kid",
      "playerLines": [
        "you make a worse door than a window",
        "your insults are adoorable",
        "you're a doork",
       ],
      "keyWords": [
        ["worse", "door", "than", "window"],
        ["your", "insults", "are", "adoorable"],
        ["you're", "a", "doork"],
       ],
      "enemyLines": [
        "a doornail is actually much smarter than you",
        "nothing will ever hinge on you",
        "you cant handle these insults",
       ],
      "dialog": funcref(self, "lounge_inspect"),
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.SchoolDoors: {
      "name": "School Doors",
      "interaction": "Inspect School Doors",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "The School Doors STAND IN YOUR WAY",
      "victory": "it appears my steel deadbolt was no match for your harsh words",
      "defeat": "rain, shine, or fire alarm, no one crosses my threshold",
      "playerLines": [
        "youre all metal no mettle",
        "everyone that gets close to you leaves",
        "your mother was the lowest bidding supplier",
       ],
      "keyWords": [
        ["all", "metal", "no", "mettle"],
        ["everyone", "gets", "close", "leaves"],
        ["your", "mother", "lowest", "bidding", "supplier"],
       ],
      "enemyLines": [
        "a doormat like you is beneath me",
        "let me choose not to open up you dont either",
        "people laughing at you behind closed doors doesn't mean you need to take it out on me",
       ],
      "dialog": funcref(self, "school_door_inspect"),
      "speed": 1.0,
      "bad_spawn_chance": 0.1,
      "spawn_time": 1.0,
    },
    
    G.ENEMIES.TheGame: {
      "name": "The Game",
      "interaction": "Inspect the game",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "The Game IS TRYING TO PLAY YOU",
      "victory": "in a literal sense you have beaten the game...",
      "defeat": "the game was too much for you i see",
      "playerLines": [
        "no one will play you three weeks from now",
        "even ign would rate this below a 3",
        "you do evoke a strong feeling... unfortunately, it's boredom",
       ],
      "keyWords": [
        ["no", "one", "will", "play", "you", "three", "weeks", "from", "now"],
        ["even", "ign", "would", "rate", "this", "below", "a", "3"],
        ["you", "evoke", "a", "strong", "feeling", "boredom"],
       ],
      "enemyLines": [
        "normally people make it here way faster than <minutes> minutes",
        "you must be pretty bad to have taken <damage> damage",
        "hey, you only cried <cry> times, that's a good day for you",
       ],
       "speed": 1.0,
       "bad_spawn_chance": 0.1,
       "spawn_time": 1.0,
    },
    
    G.ENEMIES.Credits: {
      "name": "The Credits",
      "interaction": "Inspect the credits",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "The Credits FOUND A WAY TO MAKE YOU WATCH THEM",
      "victory": "...",
      "defeat": "see you in the next life",
      # TODO line these up
      "playerLines": [
        "this gimmick has been done a ton of times already",
        "true",
        "wow i thought you put in a lot less than that",
       ],
      "keyWords": [
        ["this", "gimmick", "has", "been", "done", "already"],
        ["true"],
        ["i", "thought", "you", "put", "in", "less"],
       ],
      "enemyLines": [
        "you cant exist without me",
        "youre a poorly written character",
        "looks like theres a reason people take more than three days to make",
       ],
       "speed": 1.0,
       "bad_spawn_chance": 0.1,
       "spawn_time": 1.0,
    },
    
    G.ENEMIES.Steve: {
      "name": "Steve",
      "drop": G.InventoryItem.None,
      "interaction": "Talk to Steve",
      "health": 25,
      "xp": 30,
      "is_inanimate": false,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "dialog": funcref(self, "steve_talk"),
      "can_ever_fight": false,
      "walks": true,
      "intro": "",
      "victory": "",
      "defeat": "",
      "playerLines": [
        "",
        "",
        "",
       ],
      "keyWords": [
        [],
        [],
        [],
       ],
      "enemyLines": [
        "",
        "",
        "",
       ]
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
      "can_ever_fight": false,
      "intro": "",
      "victory": "",
      "defeat": "",
      "playerLines": [
        "",
        "",
        "",
       ],
      "keyWords": [
        [],
        [],
        [],
       ],
      "enemyLines": [
        "",
        "",
        "",
       ]
    },
  }

func principaldesk_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a desk", },
    { "speaker": "You", "dialog": "Looks like some serious learning takes place here", },
  ])

func principalposter_inspect():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a poster with a line from some book", },
    { "speaker": "You", "dialog": "Seems like a quote only a real nerd would know", },
  ])

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
        { "speaker": "You", "dialog": "Hey, a coin", },
        { "speaker": "You", "dialog": "GET:COIN", },
      ]
    )
    
    return
  
  G.dialog().start([ 
    { "speaker": "You", "dialog": "This is a wastebin.", },
    { "speaker": "You", "dialog": "You look inside...", },
    { "speaker": "You", "dialog": "There's nothing here." },
  ])

var ctfirst = true
func classroomtrash_inspect():
  if ctfirst:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "You", "dialog": "It's a wastebin. What did you think it was?", },
        { "speaker": "You", "dialog": "Were you expecting to find something valuable inside?", },
        { "speaker": "You", "dialog": "Like, c'mon. It's literally trash...", },
        { "speaker": "You", "dialog": "Oh hey, a coin!", },
        { "speaker": "You", "dialog": "GET:COIN", },
      ]
    )
    return
    
  G.dialog().start([ 
    { "speaker": "You", "dialog": "This is a wastebin.", },
    { "speaker": "You", "dialog": "Something about it seems to inspire aggression.", },
  ])

var recyfirst = true
func recycling_inspect():
  if recyfirst:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "You", "dialog": "This is a recycling bin. Used only by the most responsible and caring of students.", },
        { "speaker": "You", "dialog": "You look inside.", },
        { "speaker": "You", "dialog": "It's empty.", },
      ]
    )
    return
    
  G.dialog().start([ 
    { "speaker": "You", "dialog": "It's empty.", },
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

var which = 0

func trunchbull_talk():
  which += 1
  
  if which == 1:
    G.dialog().start([
      { "speaker": "You", "dialog": "Um, hello.", },
      { "speaker": "Miss Trunchbull", "dialog": "get out of my sight you loser", },
    ])
    return
  
  if which == 2:
    G.dialog().start([
      { "speaker": "You", "dialog": "What the...", },
      { "speaker": "Miss Trunchbull", "dialog": "i'm bored", },
    ])
    return
  
  if which >= 3:
    G.dialog().start([
      { "speaker": "Miss Trunchbull", "dialog": "shoo you pleb", },
    ])
    return

var lounge_tries = 0

func lounge_inspect():
  lounge_tries += 1 
  
  var can_open = G.has_true_enlightenment()
  
  if can_open:
    G.dialog().start([
      { "speaker": "You", "dialog": "The doors to the teachers lounge...", },
      { "speaker": "You", "dialog": "They make me...", },
      { "speaker": "You", "dialog": "ANGRY...", },
    ])

    return
  
  if lounge_tries == 1:
    G.dialog().start([
      { "speaker": "You", "dialog": "The door to the teacher's lounge is locked.", },
      { "speaker": "You", "dialog": "Probably a good idea with students this belligerent.", },
    ])
  else:
    G.dialog().start([
      { "speaker": "You", "dialog": "The teacher's lounge doors are still locked.", },
    ])

var school_door_tries = 0

func school_door_inspect():
  school_door_tries += 1 
  
  var can_open = G.has_true_enlightenment()
  
  if can_open:
    G.dialog().start([
      { "speaker": "You", "dialog": "The school doors...", },
      { "speaker": "You", "dialog": "They make me...", },
      { "speaker": "You", "dialog": "ANGRY...", },
    ])

    return
  
  if school_door_tries == 1:
    G.dialog().start([
      { "speaker": "You", "dialog": "The doors out", },
    ])
  else:
    G.dialog().start([
      { "speaker": "You", "dialog": "The school doors are still locked.", },
    ])
    
var stu1first = true
func student1_inspect():
  if stu1first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "Student", "dialog": "Hey! What are you looking at?", },
        { "speaker": "You", "dialog": "What? I—", },
        { "speaker": "Student", "dialog": "I don't care! If you wanna fight me, you'll have to do it the RIGHT way!", },
        { "speaker": "Student", "dialog": "Insult me by hitting all the RIGHT words and dodging all the WRONG ones!", },
        { "speaker": "Student", "dialog": "Every right word deals damage, but you're so DUMB I bet you couldn't even hit ONE!!", },
        { "speaker": "Student", "dialog": "You're lucky I'm tired and don't wanna fight, punk.", },
        { "speaker": "You", "dialog": "But what if I wanna fight YOU", },
        { "speaker": "Student", "dialog": "Huh? Get lost, bro. This isn't Pokemon.", },
      ]
    )
    return
    
  G.dialog().start([ 
        { "speaker": "Student", "dialog": "If you wanna fight someone, you'll have to do it the RIGHT way!", },
        { "speaker": "Student", "dialog": "Insult them by hitting all the RIGHT words and dodging all the WRONG ones!", },
        { "speaker": "Student", "dialog": "(And maybe there'll be items or powerups or something. Idk that's probably overscoping)", },
  ])

var stu2first = true
func student2_inspect():
  if stu2first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "Student", "dialog": "Ugh! I can't believe I got sent to the PRINCIPAL'S OFFICE!", },
        { "speaker": "You", "dialog": "What for lmao", },
        { "speaker": "Student", "dialog": "I didn't DO anything! Ugh! And now I have to go LOOK AT Principal Pike?! I think he might literally be Satan.", },
        { "speaker": "Student", "dialog": "*grumble*... kill your teacher ONE TIME..."},
        { "speaker": "You", "dialog": "Lol same", },
      ]
    )
    return
    
  G.dialog().start([ 
        { "speaker": "Student", "dialog": "I can't believe I have to go see Principal Pike. UGH!", },
  ])

var stu3first = true
func student3_inspect():
  if stu3first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "You", "dialog": "Sup", },
        { "speaker": "Student", "dialog": "Buh... I think I'm going CRAZY, man! Are those doors talking to me?!", },
        { "speaker": "Student", "dialog": "Everyone wants to get out, but no one's been able to since the school day began... It's the DOORS, I'm telling you!", },
        { "speaker": "You", "dialog": "Seems like a stretch idk", },
        { "speaker": "Student", "dialog": "I'M ONTO YOU, EVIL DOORS!!", },
      ]
    )
    return
    
  G.dialog().start([ 
    { "speaker": "Student", "dialog": "I'M ONTO YOU, EVIL DOORS!", },
  ])

var stu4first = true
func student4_inspect():
  if stu4first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "Student", "dialog": "Hey, where's the teacher in this classroom?", },
        { "speaker": "Student", "dialog": "Wait... hell yeah! I'M THE TEACHER NOW, SUCKAS!!", },
        { "speaker": "You", "dialog": "I don't think that's how that works", },
        { "speaker": "Student", "dialog": "WOOOOOOOOOOOOOOO", },
      ]
    )
    return
    
  G.dialog().start([ 
    { "speaker": "Student", "dialog": "I'M THE TEACHER NOW, SUCKAS!!", },
  ])

var stu5first = true
func student5_inspect():
  if stu5first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "Student", "dialog": "Why won't these lockers OPEN? I need to GET MY STUFF!", },
        { "speaker": "You", "dialog": "Have you tried hitting them", },
        { "speaker": "Student", "dialog": "Ooh, good idea!", },
        { "speaker": "Student", "dialog": "*BANGG*", },
        { "speaker": "Student", "dialog": "OW! Now my locker won't open AND my hand hurts!!!", },
        { "speaker": "You", "dialog": "Lmao gottem", },
      ]
    )
    return
    
  G.dialog().start([ 
        { "speaker": "Student", "dialog": "How will I get my textbooks now?! For, uh, the classes that are definitely happening at this school today.", },
  ])

var stu6first = true
func student6_inspect():
  if stu6first:
    first = false
    
    G.dialog().start(
      [
        { "speaker": "Student", "dialog": "Shh... Don't tell any of those STUPID teachers that I snuck into the Teachers' Lounge!", },
        { "speaker": "You", "dialog": "Hoowee check out Mister Bigshot over here", },
        { "speaker": "Student", "dialog": "MWAHAHA!!! NOW I CAN... Uh...", },
        { "speaker": "Student", "dialog": "Not gonna lie, this place is less exciting than I thought it would be.", },
      ]
    )
    return
    
  G.dialog().start([ 
        { "speaker": "Student", "dialog": "What do teachers even DO all day?! Grade paper eat coffee????", },
  ])
