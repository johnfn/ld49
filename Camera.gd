extends Camera2D

var cutscene_target = null
var old_cutscene_target = null
export var smoothing_scalar = 0.95

func _ready():
  pass

func reset():
  cutscene_target = null
  old_cutscene_target = null

func _process(delta):
  if cutscene_target != null:
    old_cutscene_target = cutscene_target - G.player().position
    position = position * smoothing_scalar + cutscene_target * (1 - smoothing_scalar)
  elif old_cutscene_target != null:
    old_cutscene_target *= smoothing_scalar
  position = G.player().position
  if old_cutscene_target != null:
    position += old_cutscene_target
