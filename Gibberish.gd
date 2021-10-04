extends Node2D

func _ready():
  pass
#  play_deep_sound(10)

func play_deep_sound(length = 5):
  for x in range(length):
    var rand = $Deep.get_children()[randi() % $Deep.get_children().size()]
    rand.play()
    
    for y in range(7):
      yield(get_tree(), "idle_frame")

func play_timmy_sound(length = 5):
  for x in range(length):
    var rand = $Timmy.get_children()[randi() % $Timmy.get_children().size()]
    rand.play()
    
    for y in range(7):
      yield(get_tree(), "idle_frame")
