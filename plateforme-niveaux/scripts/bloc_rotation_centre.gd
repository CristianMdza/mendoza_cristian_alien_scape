extends Node2D

@export var rotation_speed: float = -2.0  # sens antihoraire
@export var random_variation: float = 0.5  # ajoute un effet imprévisible

func _process(delta):
	# Variation légère pour désynchroniser avec les autres blocs
	var dynamic_speed = rotation_speed + sin(Time.get_ticks_msec() / 800.0) * random_variation
	rotation += dynamic_speed * delta
