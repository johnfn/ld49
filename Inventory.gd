extends ColorRect
class_name Inventory

var inventory_item_scene: PackedScene = preload("res://InventoryItem.tscn")

func show():
  $HoveredItemName.text = ""
  $HoveredItemDesc.text = ""
  
  visible = true
  
  for c in $ScrollContainer/VBoxContainer.get_children():
    c.queue_free()
  
  for item in G.inventory_contents:
    if item == G.InventoryItem.None:
      #hopefully this never happens lul but u never know.........
      continue
    
    var new_item = inventory_item_scene.instance()
    
    new_item.item_name = G.inventory_text[item]['name']
    new_item.item_desc = G.inventory_text[item]['desc']
    
    $ScrollContainer/VBoxContainer.add_child(new_item)
    new_item.connect("mouse_entered", self, "on_mouse_over_item", [new_item])
    new_item.connect("mouse_exited", self, "on_mouse_out_item")
    
func on_mouse_over_item(item):
  $HoveredItemName.text = item.item_name
  $HoveredItemDesc.text = item.item_desc

func on_mouse_out_item():
  $HoveredItemName.text = ""
  $HoveredItemDesc.text = ""

func _on_DoneButton_pressed():
  visible = false
