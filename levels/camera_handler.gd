extends Node2D

@onready var basePath : Path2D = $Path2D
@onready var cameraPath : PathFollow2D = $Path2D/PathFollow2D
@onready var player : CharacterBody2D = $car

#debug
@onready var camera : Camera2D = $Path2D/PathFollow2D/Camera2D

func _process(delta: float) -> void:
	var pathLength = basePath.curve.get_baked_length()
	## car x - path x
	var offset = player.position.x - (1152 / 2)
	#var progress = clampf(offset / pathLength, 0,1)
	var progress = clampf(offset, 0, pathLength)
	
	cameraPath.progress = progress
	
	print(camera.position)
	
