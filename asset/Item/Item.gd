class_name Item extends TextureRect

export (String) var id
export (String) var item_name
export(Game_Enum.EQUIPMENT_TYPE) var equiqment_type
var stack_size = 1
var quantity = 1 setget set_quantity
var level = 1
var components = {}

var lbl_quantity


func _init(item_id, data) -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	id = item_id
	item_name = data.name
	level = data.level
	texture = ResourceManager.sprites[id]
	
	if data.has("stack_size"):
		stack_size = data.stack_size
	if data.has("type"):
		equiqment_type = Game_enum.EQUIPMENT_TYPE[data.type]
	if data.has("base_stats"):
		components["base_stats"] = Base_Stat.new(data.base_stats, randf())


func _ready() -> void:
	lbl_quantity = Label.new()
	lbl_quantity.set("custom_fonts/font", ResourceManager.fonts[10])
	lbl_quantity.set("custom_colors/font_color", Color.black)
	add_child(lbl_quantity)
	set_quantity(quantity)

func set_quantity(value):
	quantity = value
	if lbl_quantity:
		lbl_quantity.text = str(quantity)
		lbl_quantity.visible  = quantity > 1

func add_item_quantity(value):
	var remainder = quantity + value - stack_size
	quantity = min(quantity+value, stack_size)
	set_quantity(quantity)
	return remainder
#func pick_item():
	
	

#func put_item():
#	mouse_filter = Control.MOUSE_FILTER_PASS
	
