extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"

const GrassEffect = preload("res://src/effect/GrassEffect.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

func create_grass_effect():
	var grassEffect = GrassEffect.instance()
	get_parent().add_child(grassEffect)
	grassEffect.global_position = global_position


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.get_collision_mask_bit(3):
		create_grass_effect()
		queue_free()
