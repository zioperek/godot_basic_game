extends Node2D

signal player_damaged
@onready var character_body_2d: CharacterBody2D = $CharacterBody2D

func _on_character_body_2d_player_take_damage() -> void:
	emit_signal("player_damaged")

func die():
	character_body_2d.die()
