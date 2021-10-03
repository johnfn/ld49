tool
extends KinematicBody2D
class_name Npc

export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

func _ready():
  for ch in $Graphics.get_children():
    ch.visible = false
    
    if ch.name == Enemies.info()[enemy_type].name:
      ch.visible = true

  walk_aimlessly()

func walk_aimlessly():
  while true:
    var next_spot: Vector2 = position + [
      Vector2.UP,
      Vector2.DOWN,
      Vector2.LEFT,
      Vector2.RIGHT,
    ][randi() % 4] * 500
    
    var ticks = 200
    while position.distance_to(next_spot) > 100 and ticks > 0:
      ticks -= 1
      
      var delta = position.direction_to(next_spot).normalized() * 100
      
      move_and_slide(delta)
      
      yield(get_tree(), "idle_frame")
    
    var wait_time = randi() % 50 + 50
    for x in range(wait_time):
      yield(get_tree(), "idle_frame")

func _process(delta):
  if Engine.editor_hint:
    _ready()

func _on_InteractionMarker_on_interact():
  Enemies.info()[enemy_type].dialog.call_func()
