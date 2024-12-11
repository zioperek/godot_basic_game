extends Node2D

@onready var player: Node2D = $Player
@onready var hud: Control = $UI/HUD
@onready var game_over: Control = $UI/GameOver
@onready var damage: AudioStreamPlayer = $Damage
@onready var hit: AudioStreamPlayer = $Hit

var lives: int = 3
var score: int = 0

func _on_player_player_damaged() -> void:
	damage.play()
	lives -= 1
	if lives == 0:
		hud.visible = false
		player.die()
		game_over.set_score(score)
		await get_tree().create_timer(0.5).timeout
		game_over.visible = true
	set_lives_of_player_ui(lives)

func increase_score():
	hit.play()
	score += 1
	hud.set_score_label(score)

func set_lives_of_player_ui(lives_number: int) -> void:
	hud.set_lives_label(lives_number)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("increase_score", increase_score)
	add_child(enemy_instance)


func _on_enemy_spawner_path_enemy_spawned(path_enemy: Variant) -> void:
	add_child(path_enemy)
	path_enemy.enemy.connect("increase_score", increase_score)
