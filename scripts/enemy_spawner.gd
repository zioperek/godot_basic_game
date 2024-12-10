extends Node2D

const ENEMY: PackedScene = preload("res://scenes/enemy.tscn")
@onready var timer: Timer = $Timer

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	timer.start(get_random_timer_value())
	timer.connect("timeout", spawn_random_enemy)

func get_random_timer_value() -> float:
	return rng.randf_range(0.3, 1)

func get_random_spawn_height() -> float:
	return rng.randf_range(0, get_viewport_rect().size.y)
	
func spawn_random_enemy() -> void:
	var enemy_instance = ENEMY.instantiate()
	enemy_instance.global_position = Vector2(get_viewport_rect().size.x + 50, get_random_spawn_height())
	add_child(enemy_instance)
