class_name Base_Stat extends Node

var stat_range = []
var scale : float

func _ready() -> void:
	pass
	
func _init(data,value) -> void:
	scale  = value
	for stat_rg in data:

		stat_range.append(Stat_Range.new(stat_rg))



func get_lines():
	var lines = []
	for stat_rg in stat_range:
		
		var stat_info = ResourceManager.stat_info[stat_rg.stat]
		var value = stat_rg.get_value(scale, stat_rg.stat)
		var text = stat_info.display.replace("#", str(value))
		lines.append(Item_Info_Line.new(text, "normal"))
	return lines
