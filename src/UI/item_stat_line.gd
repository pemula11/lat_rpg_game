class_name  Item_Info_Line extends Label



func _ready() -> void:
	pass

func _init(value, color) -> void:
	text = value
	align = Label.ALIGN_CENTER
	valign =Label.VALIGN_CENTER 
	set("custom_fonts/font", ResourceManager.fonts[10])
	set("custom_colors/font_color", ResourceManager.colors[color])
