extends Area2D

# PARAMÈTRES DE LA SCIE
@export var distance: float = 64.0         # 2 cases de 32px (2 * 32) : Distance de déplacement horizontal.
@export var speed: float = 0.5             # Vitesse du mouvement horizonal.
@export var rotation_speed: float = -180.0  # Vitesse de rotation (degrés par seconde).

# VARIABLES INTERNES
var direction: int = 1
# Position de départ sur l’axe X.
var start_x: float

# INITIALISATION
func _ready():
	# Sauvegarde la position de départ en X.
	start_x = position.x
	# Active la collision pour permettre la détection du joueur.
	$CollisionShape2D.disabled = false  
	# Connecte le signal body_entered pour détecter le contact avec le joueur.
	body_entered.connect(_on_body_entered)  

# MOUVEMENT & ROTATION
func _process(delta):
	# Fait tourner la scie (Rotation).
	rotation_degrees += rotation_speed * delta

	# Mouvement horizontal alternant.
	position.x = start_x + sin(Time.get_ticks_msec() / 500.0 * speed) * distance

# DÉTECTION DE COLLISION
func _on_body_entered(body):
	# Si le corps qui entre en collision est le joueur,
	# on lui inflige des dégâts (perte de coeur, blessure ou mort).f body is Joueur:
	if body is Joueur:
		body.prendre_degats()  
