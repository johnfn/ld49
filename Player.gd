extends KinematicBody2D

var speed = 400.0

func _ready():
  pass 

func move():
  var dx = 0
  var dy = 0
  
  dx += -1 if Input.is_action_pressed("ui_left") else 0
  dx += 1 if Input.is_action_pressed("ui_right") else 0
  
  dy += -1 if Input.is_action_pressed("ui_up") else 0
  dy += 1 if Input.is_action_pressed("ui_down") else 0
  
  var d = Vector2(dx, dy) * speed
  
  move_and_slide(d)

func check_for_interactions():
  var interactables = G.interactables
  
  var closest: Node2D = null
  var closest_dist = 99999
  
  if interactables.size() == 0:
    return
  
  for i in interactables:
    if i.position.distance_to(position) < closest_dist:
      closest_dist = i.position.distance_to(position)
      closest = i
  
  # show target only for the one we're interacting w
  
  for i in interactables:
    for child in i.get_children():
      if child.is_in_group("interactable"):
        child.visible = i == closest
  
  if Input.is_action_just_pressed("action"):
    closest.interact()
  
  if Input.is_action_just_pressed("angry"):    
    G.in_battle = true
    G.battling_against = [closest.enemy_type, closest.enemy_type]
    get_tree().change_scene("res://Battle.tscn")

func _process(delta):
  move()
  check_for_interactions()
