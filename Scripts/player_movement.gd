extends CharacterBody2D

const SPEED = 700.0

func _ready():
	add_to_group("player")

func _physics_process(_delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func die():
	get_tree().reload_current_scene()
