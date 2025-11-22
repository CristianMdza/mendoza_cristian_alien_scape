extends Area2D

func _ready():
	$AnimatedSprite2D.play("mouvement_drapeau_game_over")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$DrapeauSfx.play()
