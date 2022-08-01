class_name Equiqment_Slot extends Inventory_Slot
export(NodePath) onready var placeholder = get_node(placeholder) as TextureRect

export (Game_Enum.EQUIPMENT_TYPE) var type

func _ready() -> void:
	placeholder.texture = ItemManager.get_placeholder(type)


func set_item(new_item):
	.set_item(new_item)
	placeholder.hide()
	
func pick_item():
	.pick_item()
	placeholder.show()
	
func put_item(new_item):
	.put_item(new_item)
	placeholder.hide()
