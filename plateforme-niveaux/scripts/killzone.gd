extends Area2D

# DÉTECTION DE COLLISION
func _on_body_entered(body):
	# Si le corps qui entre en collision est le joueur,
	# on lui inflige des dégâts (perte de coeur, blessure ou mort).
	if body is Joueur:
		body.prendre_degats()
