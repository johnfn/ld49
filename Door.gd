extends StaticBody2D

var enemy_type = G.ENEMIES.Door

func _on_InteractionMarker_on_interact():
  var has_hall_pass = G.inventory_contents
  $CollisionShape2D.disabled = not $CollisionShape2D.disabled
