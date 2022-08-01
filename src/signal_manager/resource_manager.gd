class_name Resource_Manager extends Node
const STAT_PATH = "res://asset/Item/manager/stats.json"

var sprites = {
	"chestplate" : preload("res://asset/inventory/sprites/chestplate.png"),
	"crystal" : preload("res://asset/inventory/sprites/crystal.png"),
	"gold_coin" : preload("res://asset/inventory/sprites/gold.png"),
	"helmet" : preload("res://asset/inventory/sprites/helmet.png"),
	"iron_sword" : preload("res://asset/inventory/sprites/wooden_sword.png"),
	"magic_orb" : preload("res://asset/inventory/sprites/magic_orb.png"),
	"shield" : preload("res://asset/inventory/sprites/shield.png"),
	"stone_brick" : preload("res://asset/inventory/sprites/stone.png"),
	"tshirt" : preload("res://asset/inventory/sprites/tshirt.png"),
	"wood" : preload("res://asset/inventory/sprites/tree_icon.png"),
	"wooden_sword" : preload("res://asset/inventory/sprites/wooden_sword.png"),
	
	
}

var fonts = {
	10: preload("res://asset/font/quantity_lbl.tres")
}
var colors = {
	"normal" : Color("905c32")
}

var tscn = {
	"splitter" : preload("res://src/UI/Splitter.tscn"),
	"hotbar_slot" : preload("res://src/UI/hotbar_slot.tscn")
}
var stat_info = {}


func _ready() -> void:
	var file = File.new()
	file.open(STAT_PATH, File.READ)
	var data = parse_json(file.get_as_text())
	
	for stat in data:
		stat_info[Game_Enum.STAT[stat]] = data[stat]
	file.close()
