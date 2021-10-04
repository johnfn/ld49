extends StaticBody2D

var enemy_type = G.ENEMIES.Door

var tries = 0

func _on_InteractionMarker_on_interact():
  var can_open = G.has_true_enlightenment()
  
  if can_open:
    #TODO: TRigger fight?
    G.dialog().start([
      { "speaker": "You", "dialog": "The doors to the teachers lounge...", },
   ])

    queue_free()

  tries += 1 
  
  if tries == 1:
    G.dialog().start([
      { "speaker": "You", "dialog": "The door to the teacher's lounge is locked.", },
      { "speaker": "You", "dialog": "Probably a good idea with students this belligerent.", },
    ])
  else:
    G.dialog().start([
      { "speaker": "You", "dialog": "The teacher's lounge doors are still locked.", },
    ])
