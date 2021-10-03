extends ColorRect

var item_name: String = ""
var item_desc: String = ""

func _ready():
  $Name.text = item_name

func _on_InventoryItem_mouse_entered():
  modulate = Color(1.5, 1.5, 1.5, 1)

func _on_InventoryItem_mouse_exited():
  modulate = Color(1, 1, 1, 1)
