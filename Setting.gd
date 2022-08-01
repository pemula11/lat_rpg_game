extends Draggable_control


export(NodePath) onready var scale_slider = get_node(scale_slider) as HSlider
export(NodePath) onready var fullscreen_check = get_node(fullscreen_check) as CheckBox


func _ready() -> void:
	fullscreen_check.pressed = SettingManager.fullscreen


func _on_CloseBTN_pressed() -> void:
	hide()


func _on_scale_slider_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and not event.pressed:
		SettingManager.scale = scale_slider.value



func _on_CheckBox_toggled(button_pressed: bool) -> void:
	SettingManager.fullscreen = button_pressed
