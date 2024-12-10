extends Area2D

@export var ENEMY_SPEED_MIN: float = 200.0
@export var ENEMY_SPEED_MAX: float = 600.0

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var rng: RandomNumberGenerator = RandomNumberGenerator.new()
var ENEMY_SPEED: float = rng.randf_range(ENEMY_SPEED_MIN, ENEMY_SPEED_MAX)

func _ready() -> void:
	visible_on_screen_notifier_2d.connect("screen_exited", clear_instance)

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	global_position.x -= ENEMY_SPEED * delta

func clear_instance():
	queue_free()

func die():
	queue_free()
