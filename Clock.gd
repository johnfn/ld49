extends Node2D

var enemy_type = G.ENEMIES.Clock
# NOTE this should not be used

func _on_InteractionMarker_on_interact():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a clock", },
    { "speaker": "You", "dialog": "It's not ticking", },
    { "speaker": "You", "dialog": "Probably because time here never seems to end", },
  ])
