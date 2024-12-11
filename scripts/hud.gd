extends Control

@onready var score: Label = $MarginContainer/VBoxContainer/Score
@onready var label: Label = $MarginContainer/VBoxContainer/HBoxContainer/Label

func set_score_label(new_score: int) -> void:
	score.text = "SCORE: " + str(new_score)

func set_lives_label(lives: int) -> void:
	label.text = "X: " + str(lives)
