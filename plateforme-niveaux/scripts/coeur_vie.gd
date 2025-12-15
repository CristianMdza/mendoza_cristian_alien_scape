extends Area2D

@export var amplitude_respiration := 0.1
@export var vitesse_respiration := 2.0

var scale_initial := Vector2.ONE
var temps := 0.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	scale_initial = scale

func _process(delta: float) -> void:
	temps += delta
	var facteur := 1 + sin(temps * vitesse_respiration) * amplitude_respiration
	scale = scale_initial * facteur

func _on_body_entered(body):
	if body is Joueur:
		if body.vies < body.max_vies:
			body.vies += 1
			Main.set_coeurs(body.vies)
			call_deferred("queue_free")
