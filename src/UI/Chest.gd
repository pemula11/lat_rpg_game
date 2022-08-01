class_name Chest extends Button

export(int) var size = 1
export(String) var inventory_name
export(Array, String) var items

var inventory : Inventory

func _init() -> void:
	inventory = preload("res://asset/Item/Inventory.tscn").instance()

func _ready() -> void:
	inventory.size = size
	inventory.inventory_name = inventory_name
	set_item()
	
func set_item():
	for i in items:
		inventory.add_item(ItemManager.get_item(i))



func _on_Chest_pressed() -> void:
	SignalManager.emit_signal("inventory_opened", inventory)
	
