extends Node2D
class_name InteractionMarker

signal on_interact
signal on_anger

onready var player: KinematicBody2D = $"/root/Main/Player"
onready var marker = $InteractionMarker
onready var animation = $AnimationPlayer
onready var interactor = $"../"
onready var menu = $Menu

var is_player_inside = false
var has_triggered_this_time = false

enum State {
  Invisible,
  TransitionIn,
  Visible,
  ChooseAngryAnim,
  ChooseInteractAnim,
  TransitionOut,  
}

var state = State.Invisible

func _ready():
  menu.visible = false

func get_closest_interactable():
  var interactables = G.interactables
  
  var closest: Node2D = null
  var closest_dist = 99999
  
  if interactables.size() == 0:
    return
  
  var player_position = G.player().global_position
  
  for i in interactables:
    if i.global_position.distance_to(player_position) < closest_dist:
      closest_dist = i.global_position.distance_to(player_position)
      closest = i
  
  # show target only for the one we're interacting w
  
#  for i in interactables:
#    for child in i.get_children():
#      if child.is_in_group("interactable"):
#        child.visible = i == closest
  
  return closest

func choose_interact():
  print("Choose interact")
  if get_closest_interactable() == interactor:
    emit_signal("on_interact")

func choose_anger():
  G.in_battle = true
  G.battling_against = [interactor.enemy_type, interactor.enemy_type]
  get_tree().change_scene("res://Battle.tscn")

func check_for_interactions():
  if Input.is_action_just_pressed("action") and G.mode == 0:
    animation.advance(9999)
    state = State.ChooseInteractAnim
    animation.play("ChooseInteract")
    choose_interact()
    
  if Input.is_action_just_pressed("angry") and G.mode == 0:
    animation.advance(9999)
    state = State.ChooseAngryAnim
    animation.play("ChooseAngry")
    choose_anger()
  
func _process(delta):  
  match state:
    State.Invisible:
      if is_player_inside:
        state = State.TransitionIn
        menu.visible = true
        animation.play("SlideInMenu")
        animation.advance(0)
        
    State.TransitionIn:
      if not animation.is_playing():
        state = State.Visible
      
      check_for_interactions()
        
    State.Visible:
      if not is_player_inside:
        state = State.TransitionOut
        animation.play_backwards("SlideInMenu")
      
      check_for_interactions()
    
    State.ChooseInteractAnim:
      if not animation.is_playing():
        state = State.Visible

    State.ChooseAngryAnim:
      if not animation.is_playing():
        state = State.Visible

    State.TransitionOut:
      if not animation.is_playing():
        state = State.Invisible
        menu.visible = false

  if interactor.name == "MissTrunchbull" and is_player_inside:
    if animation.current_animation == "SlideInMenu" and not animation.is_playing():
      animation.play("MediumAngry")


func _on_Area2D_body_entered(body):
  if body == player:
    is_player_inside = true
    G.interactables.push_back(interactor)

func _on_Area2D_body_exited(body):
  if body == player:
    is_player_inside = false
    G.interactables.erase(interactor)
