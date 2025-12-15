# Alien 👽 Escape

**Projet-exemple de jeu de plateforme 2D** réalisé en Godot pour le cours *Interactivité Ludique*, Automne 2025, Collège Montmorency.  

Petit jeu où un **alien** explore plusieurs mondes (forêt montagneuse, temple souterrain/désert, monde glacial) remplis d’obstacles, d’ennemis, de pièges et d’objets à ramasser.  
Le but est **d’atteindre la porte finale de chaque niveau**, de **collecter un maximum de monnaies** et de trouver la **clé du dernier niveau** afin d’ouvrir la porte finale et terminer le jeu au complet.

---

## 🚀 Sommaire
- [Contexte](#contexte)
- [Modifications apportées](#modifications-apportees)
- [Système de vies et de mort](#systeme-de-vies-et-de-mort)
- [Système de monnaies et score](#systeme-de-monnaies-et-score)
- [Palette de couleurs des menus](#palette-de-couleurs-des-menus)
- [Contrôles du jeu](#controles-du-jeu)
- [Crédits](#credits)
- [Licence](#licence)

---

## 📖 Contexte

Projet basé sur un jeu créé par **Enric Granzotto Llagostera** dans le cadre du cours *Interactivité Ludique* au **Collège Montmorency**.  
J’ai effectué un **fork** du projet original afin de le modifier, d’y ajouter de nouvelles mécaniques et de lui donner une nouvelle ambiance visuelle et ludique.

---

## ✨ Modifications apportées

- Création de **3 nouveaux niveaux** :
  - Forêt montagneuse (niveau 1)
  - Temple souterrain / désert (niveau 2)
  - Monde glacial et enneigé (niveau 3)
- Nouveau **personnage alien violet** avec animations complètes  
- Ajout de mécaniques et d’éléments de gameplay :
  - Zones mortelles (chutes, vagues et laves dangereuses)
  - Escaliers interactifs
  - Portes de niveaux
  - Panneaux de messages informatifs
  - Pièges normaux et animés (scies, pointes, vagues, boules de feu, etc.)
  - Ascenseurs et plateformes mobiles
  - Trampolines
  - Objets à ramasser (monnaies, cœurs, clé)
  - Objets sonores et pièges
  - Ennemis
  - etc.
- **Textures et palettes de couleurs** adaptées à l’ambiance de chaque niveau
- Ajout de **musique et d’effets sonores** selon les événements (blessure, mort, victoire, exploration)
- Ajout d’un **HUD**, d’un panneau **d’instructions**, d’un bouton **Pause**, d’un bouton **Continuer** et d’un bouton **Quitter** dans le menu contrôle. 

---

## ❤️ Système de vies et de mort

Le jeu utilise un **système de vies par "coeurs"**, inspiré des jeux de plateforme classiques.

- Le joueur commence chaque niveau avec **3 coeurs de vie**.
- Lorsqu’il entre en contact avec un **danger** (ennemis, scies, blocs à pointes, cactus, arbustes, boules de feu, vagues d’eau et de lave dangereuses, etc.) :
  - Le joueur perd **1 coeur**
  - Une **animation de blessure** est jouée
  - Le joueur devient **temporairement invincible** (effet de clignotement) afin d’éviter les dégâts consécutifs
  - Le joueur est **ramené au dernier point de contrôle (checkpoint)**

- Lorsqu’un joueur tombe dans une **zone mortelle** (abîme, eau dangereuse, chute hors du niveau) :
  - Une **mort immédiate** est déclenchée
  - Le joueur réapparaît au **dernier checkpoint activé**

- Si le joueur perd son **dernier cœur** :
  - Une animation de **mort** est jouée
  - Le niveau est **réinitialisé**
  - Les cœurs sont remis à **3**
  - Le joueur repart du **début du niveau**

Ce système permet de maintenir un bon **équilibre entre difficulté et accessibilité**, tout en encourageant l’apprentissage des niveaux et la prudence face aux obstacles.

---

## 🪙 Système de monnaies et score

Le jeu intègre un **système de collecte de monnaies** qui influence la survie du joueur et le score final.

- Le niveau 1 contient **3 monnaies** et les deux autres contiennent **6 monnaies** chacun, pour un total de **15 monnaies** sur l’ensemble du jeu.
- Chaque fois que le joueur collecte **5 monnaies**, il obtient **1 cœur supplémentaire** (vie bonus).
- À la fin du jeu (après les 3 niveaux), un **score en pourcentage** est attribué selon le nombre total de monnaies ramassées :

  - **15 / 15 monnaies** → **Score : 100 %**
  - Sinon, le score correspond au pourcentage de monnaies collectées  
    *(exemple : 12 / 15 = 80 %)*

Ce système encourage l’exploration complète des niveaux et récompense les joueurs attentifs et persévérants.

---

## 🎨 Palette de couleurs des menus

### Palette utilisée pour le **menu principal** et le **menu de pause**

#### 🫟 Couleurs de base
- **Brun pâle** : `#c19e86` — fond du menu  
- **Brun normal** : `#6f4b3e` — bordures  
- **Blanc** : `#ffffff` — texte  
- **Noir** : `#000000` — contour du texte  

#### 🖱️ Hover
- **Brun pâle foncé** : `#a77e61` — fond  
- **Brun foncé** : `#5b3c31` — bordure  

#### 🔲 Focus
- **Transparent** : `#99999900` — fond  
- **Blanc** : `#ffffff` — bordure  

#### 🔘 Pressed
- **Brun / jaune** : `#c27729` — fond  
- **Brun très foncé** : `#331f18` — bordure  

Cette palette a été choisie pour offrir une **interface chaleureuse**, lisible et cohérente avec l’univers visuel du jeu.

---

## 🎮 Contrôles du jeu

| Action                 | Touche      |
|------------------------|------------|
| Marcher à droite       | → / D      |
| Marcher à gauche       | ← / A      |
| Sauter                 | Espace     |
| Monter (échelle)       | ↑ / W      |
| Descendre (échelle)    | ↓ / S      |
| Mettre le jeu en pause | Échap      |

---

## 🎬 Crédits

- **Jeu original :** Enric Granzotto Llagostera – Cégep Édouard-Montpetit & Collège Montmorency  
- **Version modifiée par :** Cristian Mendoza – Collège Montmorency  
- **Moteur :** Godot 4.4.1 (stable)  
- **Arrière-plans :** itch.io  
- **Sons et effets :**
  - opengameart.org
  - sfxr.me
  - pixabay.com  
- **Sprites et spritesheets :** Projet et jeu original  
- **Paquets de ressources visuelles :** *New Platformer Pack*, par Kenney  
  ([https://kenney.nl/assets/new-platformer-pack](https://kenney.nl/assets/new-platformer-pack))

---

## 📜 Licence

Projet à usage **pédagogique** (non commercial).
