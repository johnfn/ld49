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
  if Input.is_action_just_pressed("action"):
    var interactables = G.interactables 
    var first = interactables[0]

    first.interact()
  
  if Input.is_action_just_pressed("angry"):
    var interactables = G.interactables
    var first = interactables[0]
    
    G.in_battle = true
    G.battling_against = [first.enemy_type, first.enemy_type]
    get_tree().change_scene("res://Battle.tscn")

func _process(delta):
  move()
  check_for_interactions()
