extends CanvasLayer
# Script qui gère le menu de pause affiché par dessus le jeu.

# Icônes utilisées pour le bouton Pause / Lecture.
const PLAY_ICON = preload("res://assets/spritesheets/play_icon.tres")
const PAUSE_ICON = preload("res://assets/spritesheets/pause_icon.tres")

# Au chargement de la scène :
func _ready() -> void:
	# On affiche l’icône "pause" par défaut
	$PauseButton.icon = PAUSE_ICON
	# On cache le menu de pause
	$PauseMenu.hide()
	# On cache l’écran des instructions
	%InstructionsScreen.hide()

# Joue le son de clic des boutons de l’interface utilisateur
func play_click_sound() -> void:
	$ClickSound.stop() # sécurité si on clique vite
	$ClickSound.play()	

func _on_pause_button_toggled(toggled_on: bool) -> void:
	# Son de clic UI
	play_click_sound()
	# Appelé lorsque le bouton Pause est activé ou désactivé.
	if toggled_on:
		pauser()
	else:
		continuer()


func pauser():
	# Son de clic UI
	play_click_sound()
	# Met le jeu en mode pause.
	print("PAUSE MODE")
	# Changer l’icône du bouton pour "lecture".
	$PauseButton.icon = PLAY_ICON
	# Afficher le menu de pause.
	$PauseMenu.show()
	# Mettre le jeu en pause.
	get_tree().paused = true
	# Donner le focus clavier au bouton "Instructions".
	%ShowInstructionsButton.grab_focus.call_deferred()


func continuer():
	# Son de clic UI
	play_click_sound()
	# Reprendre le jeu.
	print("PLAY MODE")
	# Remettre l’icône "pause" sur le bouton,
	$PauseButton.icon = PAUSE_ICON
	# Cacher le menu de pause.
	$PauseMenu.hide()
	# Cacher les instructions si elles étaient ouvertes.
	%InstructionsScreen.hide()
	# Désactiver la pause du jeu.
	get_tree().paused = false


func _on_show_instructions_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Afficher l’écran des instructions depuis le menu pause.
	%InstructionsScreen.show()
	# Donner le focus clavier au bouton de fermeture.
	%InstructionsScreen/CloseButton.grab_focus.call_deferred()


func _on_close_instructions_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Fermer l’écran des instructions
	%InstructionsScreen.hide()
	# Reprendre le focus au bouton "Instructions".
	%ShowInstructionsButton.grab_focus.call_deferred()

# Redémarrer complètement le jeu :
func _on_button_button_down() -> void:
	# Son de clic UI
	play_click_sound()
	# Enlever la pause.
	get_tree().paused = false
	# Recharger la scène principale.
	get_tree().call_deferred("change_scene_to_file", "res://scenes/main.tscn")


func _on_quit_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# S’assurer que le jeu n’est plus en pause avant de changer de scène.
	get_tree().paused = false
	
	# Attendre un très court instant pour laisser jouer le son
	await get_tree().create_timer(0.15).timeout

	# Recharger la scène principale du jeu
	# (appel différé pour éviter un changement de scène pendant un signal)
	get_tree().call_deferred(
		"change_scene_to_file",
		"res://scenes/menu_principal.tscn"
	)
