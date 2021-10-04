extends StaticBody2D

var enemy_type = G.ENEMIES.Door

var tries = 0

func _on_InteractionMarker_on_interact():
  var can_open = G.has_hallpass()
  
  if can_open:
    G.dialog().start([
      { "speaker": "You", "dialog": "With my hallpass, no one will question me", },
    ])

    queue_free()
    return

  tries += 1 
  
  if tries >= 1:
    G.dialog().start([
      { "speaker": "You", "dialog": "The door to the rest of the school.", },
      { "speaker": "You", "dialog": "Miss Trunchbull won't let me leave...", },
    ])
