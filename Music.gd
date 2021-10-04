extends Node2D

var active_player: AudioStreamPlayer
var volume = 0.0

onready var overworld_theme = $OverworldTheme
onready var overworld_theme2 = $OverworldTheme2
onready var battle_theme = $BattleTheme
onready var boss_theme = $BossTheme

func _ready():
  $OverworldTheme.play()
  active_player = $OverworldTheme

func play_audio(new_audio: AudioStreamPlayer):
  $Tween.interpolate_property(
    active_player, 
    "volume_db", 
    0, 
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
