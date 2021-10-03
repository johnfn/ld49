extends StaticBody2D
class_name Npc

export(String) var dialog = []
export var interaction_name = "Steve"
export(G.ENEMIES) var enemy_type = G.ENEMIES.Steve 
export(G.InventoryItem) var drop_type = G.InventoryItem.None

func _on_InteractionMarker_on_interact():
  G.dialog().start(dialog)
