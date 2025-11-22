extends CanvasLayer

func _ready() -> void:
	# Affiche le nombre initial de monnaies.
	%MonnaiesLabel.text = str(Main.monnaies) # Affiche le nombre initial des monnaies.
	# Connecte le signal de collecte de monnaie à la fonction de mise à jour.
	Main.monnaie_collectee.connect(retroaction_monnaie)	# Connexion du signal.
	
	%CoeurLabel.text = str(Main.coeurs)  # Affiche le nombre initial de coeurs
	# Connecte le signal de collecte du coeur à la fonction de mise à jour.
	Main.coeur_collecte.connect(retroaction_coeur)  # Connexion du signal.

func retroaction_monnaie(valeur_monnaies):
	# Met à jour le label et joue le son quand une monnaie est collectée.
	%MonnaiesLabel.text = str(valeur_monnaies)
	# On joue un "son associé à la collecte de monnaie.
	%MonnaiesSFX.play()

func retroaction_coeur(valeur_coeurs):
	# Met à jour le label et joue le son quand un coeur est collecté.
	%CoeurLabel.text = str(valeur_coeurs)
	# On joue un "son associé à la collecte du coeur.
	%CoeurSFX.play()
