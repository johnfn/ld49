tool
extends Node2D
class_name InteractionMarker

export(float) var interaction_scale = 1

signal on_interact
signal on_anger

onready var marker = $InteractionMarker
onready var animation = $AnimationPlayer
onready var interactor = $"../"
onready var menu = $Menu
onready var interact_label = $Menu/InteractMenuItem/ZToInteract
onready var angry_label = $Menu/AngryMenuItem/XToAngry

var is_player_inside = false
var has_triggered_this_time = false

enum State {
  Invisible,
  TransitionIn,
  Visible,
  MediumAnger,
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

func is_being_shown():
  return menu.visible

func choose_interact():
  if get_closest_interactable() == interactor:
    emit_signal("on_interact")

func choose_anger():
  G.start_battle([interactor, interactor])

func check_for_interactions():
  if Input.is_action_just_pressed("action") and G.mode == G.PauseMode.None:
    animation.advance(9999)
    state = State.ChooseInteractAnim
    animation.play("ChooseInteract")
    choose_interact()
    
  if Input.is_action_just_pressed("angry") and G.mode == G.PauseMode.None and can_get_angry():
    animation.advance(9999)
    state = State.ChooseAngryAnim
    animation.play("ChooseAngry")
    choose_anger()
  
func update_labels():
  interact_label.text = Enemies.info()[interactor.enemy_type].interaction

func can_get_angry() -> bool:
  var info = Enemies.info()[interactor.enemy_type]
  
  var is_inanimate = info.is_inanimate
  var can_ever_fight = ("can_ever_fight" in info and info.can_ever_fight) or (not "can_ever_fight" in info)
  
  if not can_ever_fight:
    return false
  
  return (not is_inanimate) or (G.has_true_enlightenment())

func _process(delta):
  if Engine.editor_hint:
    $Area2D/CollisionShape2D.scale = Vector2(interaction_scale, interaction_scale)
    return
  
  if get_closest_interactable() != interactor:
    menu.visible = false
    state = State.Invisible
    return
  
  if G.in_battle:
    return
  
  $Menu/AngryMenuItem.visible = can_get_angry()
  
  match state:
    State.Invisible:
      if is_player_inside:
        state = State.TransitionIn
        menu.visible = true
        animation.play("SlideInMenu")
        animation.advance(0)
        update_labels()
        
    State.TransitionIn:
      if not animation.is_playing():
        state = State.Visible
      
      check_for_interactions()
        
    State.Visible:
      update_labels()
              
      if not is_player_inside:
        state = State.TransitionOut
        animation.play_backwards("SlideInMenu")
      
      check_for_interactions()
      
      if interactor.name == "MissTrunchbull" and G.mode == G.PauseMode.None:
        state = State.MediumAnger
        animation.play("MediumAngry")
    
    State.MediumAnger:
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
  if body == G.player():
    is_player_inside = true
    G.interactables.push_back(interactor)

func _on_Area2D_body_exited(body):
  if body == G.player():
    is_player_inside = false
    G.interactables.erase(interactor)
