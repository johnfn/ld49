extends KinematicBody2D

var speed = 400.0

func move():
  if G.in_battle:
    return
    
  var dx = 0
  var dy = 0
  
  dx += -1 if Input.is_action_pressed("ui_left") else 0
  dx += 1 if Input.is_action_pressed("ui_right") else 0
  
  dy += -1 if Input.is_action_pressed("ui_up") else 0
  dy += 1 if Input.is_action_pressed("ui_down") else 0
  
  var d = Vector2(dx, dy) * speed
  
  move_and_slide(d)

func _physics_process(delta):
  move()
