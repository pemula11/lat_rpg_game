class_name Hotbar_Slot extends Inventory_Slot

export (NodePath) onready var lbl_key = get_node(lbl_key) as Label

var key 

func _ready() -> void:
	lbl_key.text = key
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("hotbar_"+key):
		pass
