extends Sprite

var wp_index = [
	["iron sword", preload("res://asset/weapon/1/0.png")],
	["iron axe", preload("res://asset/weapon/1/3.png")],
	["iron dagger", preload("res://asset/weapon/1/27.png")],
]
onready var max_wp = wp_index.size()
var current_wp = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(wp_index.size())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
func change_wp():
	current_wp +=1
	if current_wp >= max_wp:
		current_wp = 0
	
	set_texture(wp_index[current_wp][1])
