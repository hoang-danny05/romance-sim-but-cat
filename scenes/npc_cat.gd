extends CharacterBody2D

@onready var animations = $AnimatedSprite2D

func _ready() -> void:
	animations.play("sitting")
