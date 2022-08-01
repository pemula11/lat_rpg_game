extends Node

const ITEM_PATH = "res://asset/Item/manager/items.json"

onready var items = {}


func _ready() -> void:
	var file = File.new()
	file.open(ITEM_PATH, File.READ)
	items = parse_json(file.get_as_text())
	file.close()


onready var placeholders = {
	Game_Enum.EQUIPMENT_TYPE.HEAD : preload("res://asset/inventory/sprites/placeholder_head.png"),
	Game_Enum.EQUIPMENT_TYPE.CHEST : preload("res://asset/inventory/sprites/placeholder_chest.png"),
	Game_Enum.EQUIPMENT_TYPE.MAIN_HAND : preload("res://asset/inventory/sprites/placeholder_main_hand.png"),
	Game_Enum.EQUIPMENT_TYPE.OFF_HAND : preload("res://asset/inventory/sprites/placeholder_offhand.png"),
	
}

func get_item(id : String):
	return Item.new(id, items[id])

func get_placeholder(id):
	return placeholders[id]
