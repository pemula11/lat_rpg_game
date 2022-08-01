extends Control

export(NodePath) onready var settings = get_node(settings) as Control

func _ready() -> void:
	pass



func _on_Setting_pressed() -> void:
	settings.visible = !settings.visible
	settings.raise()
