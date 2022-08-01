class_name Scale_control  extends Control

var scale : float

func _ready() -> void:
	SignalManager.connect("ui_scale_changed", self, "_on_ui_scale_changed")

func set_scale(value):
	scale = value
	rect_scale = Vector2(scale,scale)
	
func _on_ui_scale_changed(value):
	set_scale(value)
