extends Area2D

# PARAMÈTRES DE LA BOULE DE FEU
@export var distance: float = 216.0        # 6 cases et 1/4 de 32px (6 et 1/4 * 32) : Distance du mouvement vertical.
@export var speed: float = 1.0             # Vitesse du mouvement.
@export var rotation_speed: float = -270.0  # Vitesse de rotation (degrés/sec).
@export var phase_offset: float = PI      # Décalage de 180° (en radians) pour les mouvements intercalés.

# VARIABLES INTERNES
var start_y: float

# INITIALISATION
func _ready():
	start_y = position.y
	body_entered.connect(_on_body_entered)

# MOUVEMENT & ROTATION
func _process(delta):
	# Rotation continue
	rotation_degrees += rotation_speed * delta
	
	# Mouvement vertical (sinusoïdal)
	var t = (Time.get_ticks_msec() / 500.0 * speed) + phase_offset
	position.y = start_y + sin(t) * distance

# DÉTECTION DE COLLISION
func _on_body_entered(body):
	# Si le corps qui entre en collision est le joueur,
	# on lui inflige des dégâts (perte de coeur, blessure ou mort).
	if body is Joueur:
		body.prendre_degats()
