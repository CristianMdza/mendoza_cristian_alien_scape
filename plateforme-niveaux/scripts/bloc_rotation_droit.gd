extends Node2D

@export var rotation_speed: float = 2.0
@export var delay_start: float = 0.6  # secondes avant de commencer

var timer: float = 0.0
var started: bool = false

func _process(delta):
	if not started:
		timer += delta
		if timer >= delay_start:
			started = true
	else:
		rotation += rotation_speed * delta
