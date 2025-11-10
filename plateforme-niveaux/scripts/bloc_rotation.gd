extends Node2D

@export var base_speed: float = 2.0
@export var amplitude: float = 1.5     # intensité des variations de vitesse
@export var frequency: float = 1.0     # fréquence des oscillations
@export var reverse_delay: float = 3.0 # après combien de secondes la rotation s’inverse

var direction: int = 1
var timer: float = 0.0

func _process(delta):
	timer += delta

	# Inversion automatique du sens de rotation à chaque intervalle
	if timer >= reverse_delay:
		direction *= -1
		timer = 0.0

	# Oscillation de la vitesse (comme un effet de “respiration”)
	var dynamic_speed = base_speed + sin(Time.get_ticks_msec() / 500.0) * amplitude

	rotation += direction * dynamic_speed * delta
