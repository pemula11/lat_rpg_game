class_name Stat_Range extends Node

var stat
var minimum : float
var maximum : float

func _ready() -> void:
	pass

func _init(data) -> void:
	stat = Game_Enum.STAT[data.stat]
	minimum = data.minimum
	maximum = data.maximum

func get_value(scale, needed_stat):
	
	if stat==needed_stat:
		return round(lerp(minimum, maximum, stat))
		
	return 0
	
	
	
