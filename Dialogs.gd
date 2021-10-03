extends Node2D

var dialogs = {  
  "steve_dialog": [
    { "speaker": "Steve", "dialog": "Hey, I'm Steve!" },
  ],
  
  "miss_trunchbull_dialog": [
    [
      { "speaker": "You", "dialog": "Um, hello.", },
      { "speaker": "Miss Trunchbull", "dialog": "get out of my sight you loser", },
    ],
    
    [
      { "speaker": "You", "dialog": "What the...", },
      { "speaker": "Miss Trunchbull", "dialog": "i'm bored", },
    ]
  ],
  
  "billy_dialog": [
    [
      { "speaker": "Billy", "dialog": "mannnn", },
      { "speaker": "Billy", "dialog": "what did you do this time mannnnnnn", },
    ]
  ]
}

var times_talked = {}

func get_dialog(name: String):
  if not (name in times_talked):
    times_talked[name] = 0
  
  var result = dialogs[name]
  var times = times_talked[name]

  if typeof(result[times]) == TYPE_ARRAY:
    result = result[times]
  
  times_talked[name] = min(times + 1, len(dialogs[name]) - 1)
  
  return [] + result
