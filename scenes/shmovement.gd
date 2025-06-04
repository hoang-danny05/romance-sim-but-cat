extends CharacterBody2D
class_name Player

var speed = 200.0
var acceleration = 10
var decceleration = 20

var was_moving = false
var is_idle = true

@onready var animations : AnimatedSprite2D = $AnimatedSprite2D
@onready var sitting_timer : Timer = $sitting_timer


func _ready() -> void:
	position = Globals.player_destination
	pass




func _physics_process(delta: float) -> void:
	var target_vel := Vector2()
	var movement = Input.get_vector("left", "right", "none", "none")
	
	
	is_idle = abs(movement.x) <= 0.1
	# animation case: sitting
	if was_moving and is_idle: # moving -> stop
		sitting_timer.start()
	elif not was_moving and not is_idle: # stop -> moving
		sitting_timer.stop()
	
	###
	# handle kinematics
	###
	if abs(movement.x) >= 0.1:
		target_vel.x = lerp(velocity.x, movement.x * speed, acceleration * delta)
		was_moving = true
	else: 
		target_vel.x = lerp(velocity.x, 0.0, decceleration * delta)
		was_moving = false
	
	
	# animation case: walking
	if target_vel.length() <= 0.1 and (animations.animation == "idle_to_sit" or animations.animation == "bros sittin final"):
		return 
	animations.flip_h = target_vel.x < 0
	if target_vel.length() >= 0.1:
		animations.play("bros walkin")
	else:
		animations.play("idle")
	
	# animation case: sitting
	
	velocity = target_vel
	move_and_slide()



func _on_sitting_timer_timeout() -> void:
	animations.play("idle_to_sit")
	sitting_timer.stop()


func _on_animated_sprite_2d_animation_finished() -> void:
	if (animations.animation == "idle_to_sit"):
		animations.play("bros sittin final")
