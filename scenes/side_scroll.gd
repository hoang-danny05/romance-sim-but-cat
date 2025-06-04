extends Camera2D

@export var player : Player
# in pixels
@export var margin_sides = 50

# make sure the camera follows ONLY horizontally
func _ready() -> void:
	set_process(true)

func _process(delta : float) -> void:
	var diff = player.global_position.x - global_position.x
	if player:
		if (diff > margin_sides):
			global_position.x = player.global_position.x - margin_sides
		elif (-diff > margin_sides):
			global_position.x = player.global_position.x + margin_sides
		#global_position.x = player.global_position.x + min(diff, margin_sides)
	
	var change = Input.get_vector("none", "none", "debug_down", "debug_up")
	global_position += change
