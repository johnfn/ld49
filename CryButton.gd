extends 'res://ActionButton.gd'

signal take_action(action)
export(BattleScene.ACTIONS) var action = BattleScene.ACTIONS.cry 

func _on_CryButton_pressed():
  emit_signal("take_action", action)
