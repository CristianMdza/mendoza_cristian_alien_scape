extends Area2D

# PARAMÈTRES DE LA SCIE
@export var distance: float = 96.0          # 3 cases de 32px (3 * 32) : Distance de déplacement vertical.
@export var speed: float = 0.5              # Vitesse du mouvement vertical.
@export var rotation_speed: float = -180.0   # Vitesse de rotation (degrés par seconde).

# VARIABLES INTERNES
var start_y: float

# INITIALISATION
func _ready():
	# Joue automatiquement l’animation "ouvrir_yeux_scie" dès le début.
	$AnimatedSprite2D.play("ouvrir_yeux_scie")
	# Sauvegarde la position de départ en Y.
	start_y = position.y
	# Active la collision pour permettre la détection du joueur.
	$CollisionShape2D.disabled = false 
	# Connecte le signal body_entered pour détecter le contact avec le joueur.
	body_entered.connect(_on_body_entered)

# MOUVEMENT & ROTATION
func _process(delta):
	# Fait tourner la scie (Rotation).
	rotation_degrees += rotation_speed * delta
	# Inversion de phase PI = sens inverse.
	position.y = start_y + sin(Time.get_ticks_msec() / 500.0 * speed + PI) * distance

# DÉTECTION DE COLLISION
func _on_body_entered(body):
	# Si le corps qui entre en collision est le joueur,
	# on lui inflige des dégâts (perte de coeur, blessure ou mort).
	if body is Joueur:
		body.prendre_degats() 
