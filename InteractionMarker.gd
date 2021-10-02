extends Node2D

onready var player: KinematicBody2D = $"/root/Main/Player"
onready var marker = $InteractionMarker
onready var animation = $AnimationPlayer
onready var interactor = $"../"

var is_player_inside = false

func _process(delta):
  if is_player_inside:
    if not marker.visible:
      animation.play("Bobble")
                                    
    marker.visible = true
  else:
    marker.visible = false

func _on_Area2D_body_entered(body):
  if body == player:
    is_player_inside = true
    G.interactables.push_back(interactor)

func _on_Area2D_body_exited(body):
  if body == player:
    is_player_inside = false
    G.interactables.erase(interactor)
