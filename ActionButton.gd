extends TextureButton

func _ready():
  connect("take_action", $'../../../../BattleScene', "take_action") 
