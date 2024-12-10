extends CharacterBody2D

@export var PLAYER_SPEED: int = 300.0

@onready var rocket_container: Node = $RocketContainer

const ROCKET_SCENE = preload("res://scenes/rocket.tscn")

func _physics_process(_delta: float) -> void:
	velocity = Vector2(0, 0)
	if Input.is_action_pressed("moveLeft"):
		velocity.x = -PLAYER_SPEED
	if Input.is_action_pressed("moveRight"):
		velocity.x = PLAYER_SPEED
	if Input.is_action_pressed("moveUp"):
		velocity.y = -PLAYER_SPEED
	if Input.is_action_pressed("moveDown"):
		velocity.y = PLAYER_SPEED

	move_and_slide()

	global_position = global_position.clamp(Vector2(0, 0), get_viewport_rect().size)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("rocketLaunch"):
		shoot()


func shoot() -> void:
	var rocket_instance = ROCKET_SCENE.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 60
