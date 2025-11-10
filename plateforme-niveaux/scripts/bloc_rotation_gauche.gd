extends Node2D

@export var rotation_speed: float = 2.0  # radians/sec

func _process(delta):
	rotation += rotation_speed * delta
