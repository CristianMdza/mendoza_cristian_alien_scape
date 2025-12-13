extends Control

func _ready() -> void:
	# Met le focus clavier sur le bouton "Commencer" au démarrage
	$MenuContent/ShowStartButton.grab_focus()
	# Masquer les écrans secondaires au lancement.
	$SettingsScreen.hide()
	$CreditsScreen.hide()
	$InstructionsScreen.hide() 

# Joue le son de clic des boutons de l’interface utilisateur
func play_click_sound() -> void:
	$ClickSound.stop() # sécurité si on clique vite
	$ClickSound.play()	

func _on_show_start_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Attendre un très court instant pour laisser jouer le son
	await get_tree().create_timer(0.15).timeout
	# Charger la scène principale du jeu (premier niveau).
	get_tree().change_scene_to_file("res://scenes/main.tscn")

# OUVERTUE DES PARAMÈTRES

func _on_show_settings_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher le contenu du menu principal (Titre + Boutons)
	$MenuContent.hide()
	# Afficher l'écran paramètres
	$SettingsScreen.show()
	# Placer le Focus clavier sur le bouton de fermeture
	$SettingsScreen/CloseButtonSettingsScreen.grab_focus.call_deferred()

# FERMETURE DES PARAMÈTRES

func _on_close_settings_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher l'écran des paramètres
	$SettingsScreen.hide()
	# Réafficher le menu principal
	$MenuContent.show()
	# Reprendre le focus sur le bouton "paramètres"
	$MenuContent/ShowSettingsButton.grab_focus.call_deferred()

# OUVERTURE DES CRÉDITS

func _on_show_credits_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher le menu principal
	$MenuContent.hide()
	# Sécurité : cacher les autres écrans
	$SettingsScreen.hide()
	# Afficher l'écran des crédits
	$CreditsScreen.show()
	# Focus clavier sur le bouton de fermeture des crédits
	$CreditsScreen/CloseButtonCreditsScreen.grab_focus.call_deferred()

# FERMETURE DES CRÉDITS

func _on_close_credits_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher l'écran des crédits
	$CreditsScreen.hide()
	# Réafficher le menu principal
	$MenuContent.show()
	# Reprendre le focus clavier sur le bouton "Crédits"
	$MenuContent/ShowCreditsButton.grab_focus.call_deferred()

# OUVERTURE DES INSTRUCTIONS

func _on_show_instructions_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher le menu principal
	$MenuContent.hide()
	# Sécurité : cacher les autres écrans
	$SettingsScreen.hide()
	$CreditsScreen.hide()
	# Afficher les instructions
	$InstructionsScreen.show()
	# Focus sur le bouton de fermeture des instructions
	$InstructionsScreen/CloseButtonInstructionsScreen.grab_focus.call_deferred()


func _on_close_instructions_button_pressed() -> void:
	# Son de clic UI
	play_click_sound()
	# Cacher les instructions
	$InstructionsScreen.hide()
	# Réafficher l'écran des paramètres
	$SettingsScreen.show()
	# Reprendre le focus sur le bouton "Instructions" des paramètres
	$SettingsScreen/ShowInstructionsButton.grab_focus.call_deferred()

# OUVERTURE DU BOUTON DÉCORATIF "QUITTER"

func _on_show_quit_button_pressed() -> void:
	# Son de clic UI uniquement (bouton quitter décoratif)
	play_click_sound()

# OUVERTURE DU BOUTON DÉCORATIF "AUDIO"

func _on_show_audio_button_pressed() -> void:
	# Son de clic UI uniquement (bouton audio décoratif)
	play_click_sound()

# OUVERTURE DU BOUTON DÉCORATIF "VIDEO"

func _on_show_video_button_pressed() -> void:
	# Son de clic UI uniquement (bouton video décoratif)
	play_click_sound()
