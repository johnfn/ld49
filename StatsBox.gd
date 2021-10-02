extends ColorRect

onready var health_bar_bg = $HealthBarBG
onready var health_bar_fg = $HealthBarBG
onready var health_label = $HealthLabel

func _process(delta):
  var percentage = G.health / G.max_health
  health_bar_fg.rect_scale.x = percentage
  health_label.text = "Health: %d/%d" % [G.health, G.max_health]
  
