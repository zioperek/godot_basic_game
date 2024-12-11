extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy)

const ENEMY: PackedScene = preload("res://scenes/enemy.tscn")
const PATH_ENEMY = preload("res://scenes/path_enemy.tscn")

@onready var timer: Timer = $Timer
@onready var path_enemy_timer: Timer = $PathEnemyTimer

var rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	timer.start(get_random_timer_value(0.3, 1))
	timer.connect("timeout", spawn_random_enemy)

	path_enemy_timer.start(get_random_timer_value(0.8, 10))
	path_enemy_timer.connect("timeout", spawn_path_enemy)

func get_random_timer_value(min: float, max: float) -> float:
	return rng.randf_range(min, max)

func get_random_spawn_height() -> float:
	return rng.randf_range(0, get_viewport_rect().size.y)
	
func spawn_random_enemy() -> void:
	var enemy_instance = ENEMY.instantiate()
	enemy_instance.global_position = Vector2(get_viewport_rect().size.x + 50, get_random_spawn_height())
	emit_signal("enemy_spawned", enemy_instance)

func spawn_path_enemy() -> void:
	var path_enemy = PATH_ENEMY.instantiate()
	emit_signal("path_enemy_spawned", path_enemy)
