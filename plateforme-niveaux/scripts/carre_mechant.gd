extends Area2D

func _ready():
	$AnimatedSprite2D.play("agrandissement_carre_mechant")  # Animation du carré méchant.
	$CollisionShape2D.disabled = false
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.name == "Joueur":
		body.die()   
