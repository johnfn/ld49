extends Node2D


var damage_amount

func spawn(damage: int):
  damage_amount = damage
  $Text.clear()
  $Text.push_color(Color.white)
  $Text.add_text(str(damage))
  self.modulate.a = 1
  self.rotation_degrees = 0

func _process(delta):
  self.position += delta * 100*Vector2(1,-1)
  self.rotation_degrees += 100*delta
  $Text.modulate.a -= 2 * delta

  if $Text.modulate.a <= 0:
    self.queue_free()
  
