extends Node2D

@onready var player: Node2D = $Player
@onready var hud: Control = $UI/HUD
@onready var game_over: Control = $UI/GameOver

var lives: int = 3
var score: int = 0


func _on_player_player_damaged() -> void:
	lives -= 1
	if lives == 0:
		player.die()
		game_over.set_score(score)
		game_over.visible = true
	set_lives_of_player_ui(lives)

func increase_score():
	score += 1
	hud.set_score_label(score)

func set_lives_of_player_ui(lives_number: int) -> void:
	hud.set_lives_label(lives_number)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("increase_score", increase_score)
	add_child(enemy_instance)
