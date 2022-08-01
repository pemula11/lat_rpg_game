extends KinematicBody2D


export var MAX_SPEED = 100
export var ACCELERATION = 500
export var FRICTION = 500
var velocity = Vector2.ZERO
var knockback = Vector2.ZERO
export var power_knockback = 225

onready var animationSprite = $AnimatedSprite
onready var animationplayer = $AnimationPlayer
onready var hurtbox = $hurtbox
onready var hitbox = $hitbox
onready var playerdetection = $PlayerDetection
onready var softcollision = $SoftCollision
onready var stat = $Stat
onready var wanderController = $WanderController

const enemydeadeffect = preload("res://src/effect/Slime_dead.tscn")

enum {
	IDLE,
	WALK,
	CHASE
}

var state = IDLE
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationSprite.play("Idle")

func _physics_process(delta: float) -> void:
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	match state:
		IDLE:
			animationSprite.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			if wanderController.get_time_left() == 0:
				refresh_state()
		WALK:
			animationSprite.play("Walk")
			seek_player()
			if wanderController.get_time_left() == 0:
				refresh_state()
			acceleration_toward_point(wanderController.target_position,delta)
			
			if global_position.distance_to(wanderController.target_position) <= 4:
				refresh_state()
		CHASE:
			animationSprite.play("Chase")
			var player = playerdetection.player
			if player != null and global_position.distance_to(wanderController.start_position) <= 100:
					acceleration_toward_point(player.global_position,delta)
			
			else:
				state = WALK
	if softcollision.is_colliding():
		velocity += softcollision.get_push_vector() * delta *600
	velocity = move_and_slide(velocity)

func acceleration_toward_point(poin, delta):
	var direction = global_position.direction_to(poin)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	animationSprite.flip_h = velocity.x < 0

func seek_player():
	if playerdetection.can_see_player() :
		
		state = CHASE

func refresh_state():
	state = pick_random_state([IDLE,WALK,WALK])
	wanderController.start_time_wander(rand_range(1,3))

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func _on_hurtbox_area_entered(area: Area2D) -> void:
	stat.health -= area.damage
	hurtbox.create_hit_effect()
	knockback = area.knockback_vector * power_knockback
	
	


func _on_Stat_no_health() -> void:
	queue_free()
	var enemydead = enemydeadeffect.instance()
	get_parent().add_child(enemydead)
	enemydead.global_position = global_position
