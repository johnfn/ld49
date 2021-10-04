extends Node2D

enum State {
  Invisible,
  Dim,
  FadeIn,
  Visible,
  FadeOut,  
}

var state = State.Invisible

func _ready():
  $Graphics.modulate = Color(1, 1, 1, 0)

func _process(delta):
  match state:
    State.Invisible:
      return
    State.Dim:
      return
    State.Visible:
      return
    State.FadeIn:
      if $Graphics.modulate.a < 1.0:
        $Graphics.modulate.a = min(1.0, $Graphics.modulate.a + 0.05)
      else:
        state = State.Visible
    State.FadeOut:
      if $Graphics.modulate.a > 0.3:
        $Graphics.modulate.a = max(0.3, $Graphics.modulate.a - 0.05)
      else:
        state = State.Dim
        
func _on_Area2D_body_entered(body):
  if body == G.player():
    state = State.FadeIn

func _on_Area2D_body_exited(body):
  if body == G.player():
    state = State.FadeOut
  
func setLit():
  state = State.Visible
  $Graphics.modulate.a = 1
    
