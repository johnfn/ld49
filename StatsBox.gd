extends TextureRect

onready var level_label = $VBoxContainer/LevelLabel

onready var health_label = $VBoxContainer/HealthLabel
onready var xp_label = $VBoxContainer/XPLabel

func _process(delta):
  visible = not G.in_battle
  health_label.text = "Health: %d/%d" % [G.health, G.max_health]
  
  xp_label.text = "XP: %d/%d" % [G.xp, G.next_level_xp()]

  level_label.text = "Level: %d" % G.get_level()
