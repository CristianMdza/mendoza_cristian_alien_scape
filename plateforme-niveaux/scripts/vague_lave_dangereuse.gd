extends Area2D

# INITIALISATION DE VAGUE DE LAVE DANGEREUSE
func _ready():
	# Active la collision pour permettre la détection du joueur.
	$CollisionShape2D.disabled = false
	# Connecte le signal body_entered pour détecter le contact avec le joueur.
	body_entered.connect(_on_body_entered)

# DÉTECTION DE COLLISION
func _on_body_entered(body):
	# Si le corps qui entre en collision est le joueur,
	# on lui inflige des dégâts (perte de coeur, blessure ou mort).
	if body is Joueur:
		body.prendre_degats()
