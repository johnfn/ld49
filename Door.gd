extends StaticBody2D

var enemy_type = G.ENEMIES.Door

func _on_InteractionMarker_on_interact():
  var has_hall_pass = G.has_hallpass()
  
  if has_hall_pass:
    G.dialog().start([
      { "speaker": "You", "dialog": "This leads to the rest of the school", },
      { "speaker": "You", "dialog": "With my hall pass, I'm free to explore", },
   ])

    queue_free()
  else:
    G.dialog().start([
      { "speaker": "You", "dialog": "The doors out of the classroom.", },
      { "speaker": "You", "dialog": "Miss Trunchbull won't let me out without a hall pass", },
   ])
  
