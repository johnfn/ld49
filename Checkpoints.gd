extends Node2D

var last_position: Vector2

func _ready():
  last_position = G.player().position

func _on_Area2D_body_entered(body):
  if body == G.player():
    last_position = body.position

func _on_Area2D3_body_entered(body):
  if body == G.player():
    last_position = body.position

func _on_Area2D2_body_entered(body):
  if body == G.player():
    last_position = body.position
