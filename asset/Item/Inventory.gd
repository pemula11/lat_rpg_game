class_name Inventory extends NinePatchRect

var inventory_slot_res = preload("res://asset/Item/Inventory_slot.tscn")
export(String) var inventory_name
export(int) var size = 0 setget set_inventory_size

var slots : Array = []

export (NodePath) onready var title = get_node(title) as Label

export (NodePath) onready var slot_container = get_node(slot_container)  

func _ready() -> void:
	for s in slots:
		slot_container.add_child(s)
	set_title()
	SignalManager.emit_signal("inventory_ready", self)

func set_title():
	title.text = " - " + inventory_name + " - "

func set_inventory_size(value):
	size = value
	rect_min_size.y = 50 + (ceil(size/6.0)-1) * 22
	
	for s in size:
		var new_slot = inventory_slot_res.instance()
		slots.append(new_slot)

func add_item(item):
	for s in slots:
		if not s.item:
			s.set_item(item)
			return
