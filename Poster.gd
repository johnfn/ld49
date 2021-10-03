extends Node2D

var enemy_type = G.ENEMIES.Poster

func _on_InteractionMarker_on_interact():
  G.dialog().start([      
    { "speaker": "You", "dialog": "It's a poster", },
    { "speaker": "You", "dialog": "It has some dumb advice", },
  ])
