extends Chest

export(int) var number_of_items

func _ready() -> void:
	pass

func set_item():
	for nb in number_of_items:
		inventory.add_item(ItemManager.get_item(items[randi()%items.size()]))
