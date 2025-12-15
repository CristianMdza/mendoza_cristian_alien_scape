class_name Joueur
extends CharacterBody2D

# PARAMÈTRES DE DÉPLACEMENT
const SPEED := 300.0
const JUMP_VELOCITY := -500.0
const glisser_mur_mod := 0.15

# SYSTÈME DE VIES (PAR NIVEAU)
@export var max_vies := 3
var vies := 3

var spawn_position: Vector2
var checkpoint_position: Vector2
var est_mort := false
var est_invincible := false

@export var duree_invincibilite := 1.0

# ÉTATS DU JOUEUR
enum Etat { REPOS, PROMENER, SAUT, GLISSE_MUR }
var etat_courant := Etat.REPOS

# INITIALISATION
func _ready() -> void:
	spawn_position = global_position
	checkpoint_position = spawn_position
	vies = max_vies
	Main.set_coeurs(vies)

# PHYSIQUE & DÉPLACEMENT
func _physics_process(delta: float) -> void:
	if est_mort:
		return
 
	if not is_on_floor():
		if is_on_wall() and velocity.y > 0:
			etat_courant = Etat.GLISSE_MUR
			velocity += get_gravity() * delta * glisser_mur_mod
			$AnimatedSprite2D.play("glisser_mur")
 
			if Input.is_action_just_pressed("sauter"):
				velocity.y = JUMP_VELOCITY
				if has_node("JumpSfx"):
					$JumpSfx.play()
				velocity.x = move_toward(velocity.x, 0, SPEED)
		else:
			etat_courant = Etat.SAUT
			velocity += get_gravity() * delta
			$AnimatedSprite2D.play("sauter")
	else:
		if velocity.x == 0:
			etat_courant = Etat.REPOS
			$AnimatedSprite2D.play("repos")
		else:
			etat_courant = Etat.PROMENER
			$AnimatedSprite2D.play("promener")
 
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
 
	if Input.is_action_just_pressed("sauter") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		if has_node("JumpSfx"):
			$JumpSfx.play()
 
	var direction := Input.get_axis("promener_gauche", "promener_droite")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
 
	move_and_slide()

# CHECKPOINT
func set_checkpoint(pos: Vector2) -> void:
	checkpoint_position = pos

# DÉGÂTS 
func prendre_degats() -> void:
	if est_invincible or est_mort:
		return

	vies -= 1
	Main.set_coeurs(vies)

	if vies <= 0:
		mort_definitive()
	else:
		blessure()

# BLESSURE
func blessure() -> void:
	est_invincible = true

	if has_node("AnimatedSprite2D"):
		$AnimatedSprite2D.play("blessure")

	if has_node("BlessureSfx"):
		$BlessureSfx.play()

	await blink()
	respawn_checkpoint()

	await get_tree().create_timer(duree_invincibilite).timeout
	est_invincible = false

# EFFET BLINK (INVINCIBILITÉ)
func blink() -> void:
	for i in range(6):
		modulate.a = 0.2
		await get_tree().create_timer(0.1).timeout
		modulate.a = 1.0
		await get_tree().create_timer(0.1).timeout

# RESPAWN
func respawn_checkpoint() -> void:
	global_position = checkpoint_position
	velocity = Vector2.ZERO

# MORT DÉFINITIVE
func mort_definitive() -> void:
	est_mort = true

	if has_node("AnimatedSprite2D"):
		$AnimatedSprite2D.play("mort")

	if has_node("MortEchecSfx"):
		$MortEchecSfx.play()

	await get_tree().create_timer(1.0).timeout

	# RESET NIVEAU
	vies = max_vies
	Main.set_coeurs(vies)
	checkpoint_position = spawn_position
	global_position = spawn_position
	velocity = Vector2.ZERO
	est_mort = false
