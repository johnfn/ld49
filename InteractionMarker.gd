extends Node2D
class_name InteractionMarker

onready var player: KinematicBody2D = $"/root/Main/Player"
onready var marker = $InteractionMarker
onready var animation = $AnimationPlayer
onready var interactor = $"../"
onready var menu = $Menu

var is_player_inside = false
var has_triggered_this_time = false

func _ready():
  menu.visible = false

func _process(delta):
  var just_changed = is_player_inside != marker.visible
  
  if is_player_inside:
    if not has_triggered_this_time:     
      marker.visible = true
      menu.visible = true
      has_triggered_this_time = false
  else:
    marker.visible = false
  
  if just_changed:
    if is_player_inside:
      animation.play("Bobble")
      animation.play("SlideInMenu")
      animation.advance(0)
      has_triggered_this_time = false
    else:
      if not has_triggered_this_time:
        animation.play_backwards("SlideInMenu")
      
  if Input.is_action_just_pressed("action") and is_player_inside and not has_triggered_this_time:
    animation.play("ChooseInteract")
    has_triggered_this_time = true
  
  if Input.is_action_just_pressed("angry") and is_player_inside and not has_triggered_this_time:
    animation.play("ChooseAngry")
    has_triggered_this_time = true

func _on_Area2D_body_entered(body):
  if body == player:
    is_player_inside = true
    G.interactables.push_back(interactor)

func _on_Area2D_body_exited(body):
  if body == player:
    is_player_inside = false
    G.interactables.erase(interactor)
