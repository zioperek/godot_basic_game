extends Control

@onready var score_label: Label = $Panel/MarginContainer3/ScoreLabel


func set_score(new_score: int ) -> void:
	score_label.text = "SCORE: " + str(new_score)
	
func _on_button_pressed() -> void:
	get_tree().reload_current_scene()
