extends Area2D
class_name InteractibleComponent

#@export var player : Player
@export var can_interact : bool = true # supports disabling
@export var on_interaction : Callable
@export var interact_prompt : Sprite2D 

# eventually, we want a LIST of each passage
	# characterSprite 
	# message : string
	
var player_can_interact : bool = false # if the player is within range

func _ready():
	collision_layer = 2 # appear as interactable
	collision_mask = 0b001 # only collide with player
	
	interact_prompt.visible = false


func _process(delta: float) -> void:
	if player_can_interact and Input.is_action_just_pressed("interact"):
		print("INTERACT!!")
		if on_interaction:
			on_interaction.call()


func _on_body_entered(body: Node2D) -> void:
	if (can_interact):
		if body is Player:
			player_can_interact = true
			interact_prompt.visible = true
		else:
			print("MSG: NON-PLAYER entered interact body!")




func _on_body_exited(body: Node2D) -> void:
	if (can_interact):
		if body is Player:
			player_can_interact = false
			interact_prompt.visible = false
		else:
			print("MSG: NON-PLAYER exited interact body!")
