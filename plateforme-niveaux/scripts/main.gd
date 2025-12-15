extends Node

# =========================
# DONNÉES GLOBALES (HUD)
# =========================
@export var monnaies := 0
@export var coeurs := 0 

# =========================
# SIGNAUX
# =========================
signal monnaie_collectee(valeur)
signal coeur_collecte(valeur)
signal cle_collectee(groupe_cle)

# =========================
# CLÉ
# =========================
func debloquer_cle(groupe_cle):
	cle_collectee.emit(groupe_cle)

# =========================
# MONNAIES
# =========================
func augmenter_monnaies():
	monnaies += 1
	monnaie_collectee.emit(monnaies)

# =========================
# CŒURS (pickup simple)
# =========================
func augmenter_coeurs():       
	coeurs += 1
	coeur_collecte.emit(coeurs)

# ✅ NOUVELLE FONCTION (OBLIGATOIRE)
# Forcer une valeur précise de cœurs (mort, reset, début niveau)
func set_coeurs(valeur: int) -> void:
	coeurs = valeur
	coeur_collecte.emit(coeurs)

# =========================
# CHANGEMENT DE SCÈNE
# =========================
func changer_scene(nouvelle_scene: PackedScene):
	if not nouvelle_scene:
		var path = "<null>"
		if typeof(nouvelle_scene) == TYPE_OBJECT and nouvelle_scene and nouvelle_scene.has_method("resource_path"):
			path = nouvelle_scene.resource_path
		push_warning("Main.changer_scene called with null/invalid nouvelle_scene; aborting scene change. resource_path=%s" % path)
		return

	print("changer scene -> %s" % str(nouvelle_scene))
	get_tree().call_deferred("change_scene_to_packed", nouvelle_scene)
