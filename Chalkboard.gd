extends Node2D

var enemy_type = G.ENEMIES.Chalkboard

func _on_InteractionMarker_on_interact():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a chalkboard", },
    { "speaker": "You", "dialog": "Miss Trunchbull is teaching us how to draw squiggly things with chalk", },
  ])
