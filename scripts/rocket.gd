extends Area2D

@export var ROCKET_SPEED: float = 500.0

@onready var visible_notifier: VisibleOnScreenNotifier2D = $VisibleNotifier

func _ready() -> void:
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta: float) -> void:
	global_position.x += ROCKET_SPEED * delta

func _on_screen_exited():
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	queue_free()
	area.die()
