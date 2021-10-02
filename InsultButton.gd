extends 'res://ActionButton.gd'

signal take_action(action)
export(BattleScene.ACTIONS) var action = BattleScene.ACTIONS.insult 

func _on_InsultButton_pressed():
  emit_signal("take_action", action)
 
