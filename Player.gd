extends KinematicBody2D

var speed = 400.0

#func _ready():
#  for x in range(50):
#    yield(get_tree(), "idle_frame")
#  G.cinematics.run_game_cinematic()

func move():
  if G.in_battle:
    return
    
  var dx = 0
  var dy = 0
  
  dx += -1 if Input.is_action_pressed("ui_left") else 0
  dx += 1 if Input.is_action_pressed("ui_right") else 0
  
  dy += -1 if Input.is_action_pressed("ui_up") else 0
  dy += 1 if Input.is_action_pressed("ui_down") else 0
  
  var d = Vector2(dx, dy) * speed * (5 if (G.debug and Input.is_key_pressed(KEY_SHIFT)) else 1)
  
  move_and_slide(d)

func _physics_process(delta):
  move()
