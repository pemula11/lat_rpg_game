extends KinematicBody2D

export var MAX_SPEED = 100
export var ACCELERATION = 500
export var FRICTION = 500
var velocity = Vector2.ZERO
var index_wp = 0
var knockback = Vector2.ZERO
onready var animationTree = $AnimationTree
onready var animationPlayer = $AnimationPlayer

onready var animationState = animationTree.get("parameters/playback")
onready var swordhit = $hitposition/Swordhitbox
onready var sprite = $Sprite
onready var hitpos = $hitposition
onready var hurtbox = $hurtbox
onready var label = $Label
const duskpar = preload("res://src/effect/DuskParticle.tscn")
onready var PosWp = $PositionWp
onready var weapon = $PositionWp/weapon
enum {
	ATTACK,
	MOVE
}

var state = MOVE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationTree.active = true
	randomize()

func _physics_process(delta: float) -> void:
	label.text = "hp : " + str(PlayerStat.health)
	match state:
		ATTACK:
			attack_state()
		MOVE:
			move_state(delta)


func move_state(delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x =  Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y =  Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	if input_vector != Vector2.ZERO:
		
		swordhit.knockback_vector = input_vector
		animationState.travel("Run")
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Slash/blend_position", input_vector)
		
		
		
		#animationTree.set("parameters/Run/blend_position", input_vector.x)	
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	if Input.is_action_just_pressed("serang"):
		state = ATTACK
	
	move()



func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("change_weapon"):
		weapon.change_wp()


func move():
	velocity = move_and_slide(velocity)

func attack_state():
	velocity = Vector2.ZERO
	animationState.travel("Slash")
	
func attack_animate_finish():
	state = MOVE

func dusk_anim():
	var Duskpar = duskpar.instance()
	get_parent().add_child(Duskpar)
	Duskpar.global_position = global_position

func _on_hurtbox_area_entered(area: Area2D) -> void:
	PlayerStat.health -= area.damage
	hurtbox.create_hit_effect()
