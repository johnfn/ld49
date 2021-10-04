tool
extends KinematicBody2D
class_name Npc

export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 

var starting_room

func get_starting_room():
  var x = self
  var room
  
  while x.get_parent() != null:
    x = x.get_parent()
    if "is_room" in x:
      room = x
  
  starting_room = room

func render_proper_sprite():
  for ch in $Graphics.get_children():
    ch.visible = false
    
    if ch.name == Enemies.info()[enemy_type].name:
      ch.visible = true
  
func _ready():
  if Engine.editor_hint:
    return
  
  render_proper_sprite()
  get_starting_room()
  
  if "walks" in Enemies.info()[enemy_type]:
    walk_aimlessly()

func is_point_in_starting_room(pt: Vector2):
  var space = get_world_2d().get_direct_space_state()
  var results = space.intersect_point(
    pt, 32, [], 0x7FFFFFFF, true, true
  )
  
  for r in results:
    if r.collider == starting_room.bounds:
      return true
  
  return false
  
func walk_aimlessly():
  while true:
    var next_spot: Vector2 = Vector2.ZERO
    
    var delta = [
      Vector2.UP,
      Vector2.DOWN,
      Vector2.LEFT,
      Vector2.RIGHT,
    ][randi() % 4] * 500
    var rel_destination = delta + position
    var abs_destination = delta + global_position
    
    # make sure npc doesnt leave room lol

    if not is_point_in_starting_room(abs_destination):
      for x in range(10):
        yield(get_tree(), "idle_frame")
      continue
    
    var ticks = 200
    while position.distance_to(next_spot) > 100 and ticks > 0:
      #dont walk while menu is visible
      while $InteractionMarker.is_being_shown():
        yield(get_tree(), "idle_frame")
      
      ticks -= 1
      
      var d = position.direction_to(rel_destination).normalized() * 100
      
      move_and_slide(d)
      
      yield(get_tree(), "idle_frame")
    
    var wait_time = randi() % 50 + 50
    
    for x in range(wait_time):
      yield(get_tree(), "idle_frame")

func _process(delta):
  if Engine.editor_hint:
    render_proper_sprite()
  if $InteractionMarker.is_being_shown():
    $Graphics.modulate = Color(2, 2, 2, 1)
  else:
    $Graphics.modulate = Color(1, 1, 1, 1)

func _on_InteractionMarker_on_interact():
  Enemies.info()[enemy_type].dialog.call_func()
