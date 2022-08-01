extends Draggable_control

export(NodePath) onready var inventory_left = get_node(inventory_left) as Inventory
export(NodePath) onready var inventory_right = get_node(inventory_right) as Inventory
export(NodePath) onready var equiqment = get_node(equiqment) as Inventory

func _ready() -> void:
	pass
