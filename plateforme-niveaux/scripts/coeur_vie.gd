extends Area2D

# Paramètres de respiration.
@export var amplitude_respiration := 0.1   # Variation de scale.
@export var vitesse_respiration := 2.0     # Vitesse du battement.

var scale_initial := Vector2.ONE
var temps := 0.0

func _ready() -> void:
	# Connecte le signal lorsqu'un corps entre dans la zone (collision).
	body_entered.connect(_on_body_entered)
	# Sauvegarde la taille initiale pour pouvoir appliquer l'effet de respiration.
	scale_initial = scale  

func _process(delta: float) -> void:
	temps += delta
	
	# Respiration (scale).
	var facteur := 1 + sin(temps * vitesse_respiration) * amplitude_respiration
	scale = scale_initial * facteur

func _on_body_entered(body):
	# Vérifie si le corps touché est le joueur.
	if body is Joueur:
		Main.augmenter_coeurs()  # Incrémente le nombre de coeurs dans le HUD.
		call_deferred("queue_free")  # Supprime le coeur après collecte.
