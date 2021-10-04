extends ColorRect

onready var name_label = $NameLabel

onready var health_bar_bg = $HealthBarBG
onready var health_bar_fg = $HealthBarBG

onready var xp_bar_bg = $XPBarBG
onready var xp_bar_fg = $XPBarFG

onready var health_label = $HealthLabel
onready var xp_label = $XPLabel

func _process(delta):
  var percentage = G.health / G.max_health
  health_bar_fg.rect_scale.x = percentage
  health_label.text = "Health: %d/%d" % [G.health, G.max_health]
  
  var xp_percentage = float(G.xp) / float(G.next_level_xp())
  xp_bar_fg.rect_scale.x = xp_percentage
  xp_label.text = "XP: %d/%d" % [G.xp, G.next_level_xp()]

  name_label.text = "Timmy - Level %d" % G.get_level()
