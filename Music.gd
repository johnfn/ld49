extends Node2D

var active_player: AudioStreamPlayer
var volume = -80 if G.debug else -6.0

onready var overworld_theme = $OverworldTheme
onready var overworld_theme2 = $OverworldTheme2
onready var battle_theme = $BattleTheme
onready var boss_theme = $BossTheme
onready var victory = $Victory 

onready var dialog_tick_1 = $DialogTick1
onready var dialog_tick_2 = $DialogTick2
onready var dialog_tick_3 = $DialogTick3
onready var dialog_tick_4 = $DialogTick4
onready var dialog_tick_5 = $DialogTick5
onready var dialog_tick_6 = $DialogTick6
onready var dialog_tick_7 = $DialogTick7
onready var dialog_tick_9 = $DialogTick9

onready var confirm_1 = $Confirm1
onready var confirm_2 = $Confirm2
onready var confirm_3 = $Confirm3

onready var wrong = $Wrong
onready var wrong2 = $Wrong2
onready var ow = $Ow
onready var right = $Right

func _ready():
  $OverworldTheme.play()
  $OverworldTheme.volume_db = volume
  active_player = $OverworldTheme

func play_tick_for(name: String):
  if name == "You" or name == "Timmy":
    Music.dialog_tick_1.play()
  elif name == "Principal Pike":
    Music.dialog_tick_7.play()
  elif name == "Miss Trunchbull":
    Music.dialog_tick_9.play()
  else:
    Music.dialog_tick_2.play()

func play_audio(new_audio: AudioStreamPlayer):
  if new_audio == active_player:
    active_player.volume_db = volume
    
    return
  
  $Tween.interpolate_property(
    active_player, 
    "volume_db", 
    active_player.volume_db, 
    -80, 
    1.0,
    Tween.TRANS_LINEAR, 
    Tween.EASE_IN, 
    0
  )
  $Tween.start()
  
  active_player = new_audio
  new_audio.volume_db = volume
  new_audio.play()
