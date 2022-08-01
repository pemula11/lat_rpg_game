extends Draggable_control


export (NodePath) onready var inventory_container = get_node(inventory_container) as Control

var current_inventory = []

func _ready() -> void:
	SignalManager.connect("inventory_opened", self, "_on_inventory_opened")
	
func close():
	visible = false
	for i in current_inventory:
		inventory_container.remove_child(i)
	current_inventory = []
	

func _on_inventory_opened(inventory: Inventory):
	if current_inventory.size() ==0:
		rect_size.y = 40
	if current_inventory.has(inventory):
		
		return
		
	
	inventory_container.add_child(inventory)
	current_inventory.append(inventory)
	rect_size.y += inventory.rect_size.y + inventory_container.get_constant("separation")
	show()


func _on_CloseBTN_pressed() -> void:
	close()
