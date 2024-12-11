extends Area2D

@export var ENEMY_SPEED_MIN: float = 200.0
@export var ENEMY_SPEED_MAX: float = 500.0

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

signal increase_score

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
@export var ENEMY_SPEED: float = get_randomized_speed()

func _ready() -> void:
	visible_on_screen_notifier_2d.connect("screen_exited", clear_instance)
	
func _process(_delta: float) -> void:
	pass

func get_randomized_speed() -> float:
	return rng.randf_range(ENEMY_SPEED_MIN, ENEMY_SPEED_MAX)

	
func _physics_process(delta: float) -> void:
	global_position.x -= ENEMY_SPEED * delta

func clear_instance():
	queue_free()

func die():
	emit_signal("increase_score")
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	queue_free()
	body.take_damage()
