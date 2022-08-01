extends Node2D

export(int) var walk_range = 32
onready var start_position = global_position
onready var target_position = global_position
onready var timer = $Timer

func _ready() -> void:
	update_target_position()

func update_target_position():
	target_position = Vector2(rand_range(-walk_range, walk_range),rand_range(-walk_range,walk_range))
	target_position = start_position + target_position

func get_time_left():
	return timer.time_left

func start_time_wander(duration):
	timer.start(duration)

func _on_Timer_timeout() -> void:
	update_target_position()
