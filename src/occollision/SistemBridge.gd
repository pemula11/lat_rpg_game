extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_AreaBridge_body_entered(body: Node) -> void:
	
	body.set_z_index(10)
	body.set_collision_mask_bit(10, false)


func _on_AreaBridge_body_exited(body: Node) -> void:
	body.get_collision_mask_bit(10)
	body.set_z_index(0)
	body.set_collision_mask_bit(10, true)


#func _on_Area2D_body_entered(body: Node) -> void:
	
#	$obj.set_collision_layer_bit(0, false)
#	$YSort/Player.set_z_index(10)
#	print($obj.get_collision_layer_bit(0))


#func _on_Area2D_body_exited(body: Node) -> void:
#	$YSort/Player.set_z_index(0)
#	$obj.set_collision_layer_bit(0, true)
