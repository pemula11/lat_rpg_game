extends Area2D

var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func can_see_player():
	return player != null

func _on_PlayerDetection_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		player = body


func _on_PlayerDetection_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player = null
