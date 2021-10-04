tool
extends Node

func info():
  return {
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
      "health": 25,
      "xp": 30,
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
       ]
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
       ]
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
       ]
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
    },
    
    G.ENEMIES.LoungeDoor: {
      "name": "Teacher's Lounge Door",
      "interaction": "TODO",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": true,
      "battle_tscn": load("res://BattleEnemy.tscn"),
      "intro": "The Teacher's Lounge Door IS LOCKED IN YOUR SIGHTS",
      "victory": "",
      "defeat": "",
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
    },
    
    G.ENEMIES.SchoolDoors: {
      "name": "School Doors",
      "interaction": "TODO",
      "drop": G.InventoryItem.None,
      "health": 25,
      "xp": 30,
      "is_inanimate": false, # TODO debugging
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
       ]
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
       ]
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
        { "speaker": "You", "dialog": "[You found a COIN]", },
        { "speaker": "You", "dialog": "GET:COIN", },
      ]
    )
    return
    
  G.dialog().start([ 
    { "speaker": "You", "dialog": "This is a wastebin.", },
    { "speaker": "You", "dialog": "Something about it seems to inspire aggression.", },
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
