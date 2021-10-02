extends Node2D

var dialogs = {
  "wastebin_dialog": [
    [
      "This is a wastebin.",
      "You look inside...",
      "Hey, a coin!",
      "GET:COIN",
    ],
    [ 
      "This is a wastebin.",
      "You look inside...",
      "There's nothing here."
    ]
  ],
  
  "steve_dialog": [
    "Hey, I'm Steve!"
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
