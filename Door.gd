extends StaticBody2D

var enemy_type = G.ENEMIES.Door

func _on_InteractionMarker_on_interact():
  $CollisionShape2D.disabled = not $CollisionShape2D.disabled
