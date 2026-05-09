extends Node2D

@export var enemy_scene: PackedScene

const SPAWN_Y = -300.0
const DIFFICULTY_INTERVAL = 15.0

var fall_speed = 500.0
var difficulty_timer = 0.0
var max_enemies = 5
var min_interval = 3.0
var max_interval = 6.0

var timers = []

func _ready():
	for i in max_enemies:
		timers.append(randf_range(1.0, max_interval))

func _process(delta):
	for i in timers.size():
		timers[i] -= delta
		if timers[i] <= 0.0:
			var x = randf_range(50, get_viewport_rect().size.x - 50)
			spawn_enemy(Vector2(x, SPAWN_Y))
			timers[i] = randf_range(min_interval, max_interval)

	difficulty_timer += delta
	if difficulty_timer >= DIFFICULTY_INTERVAL:
		difficulty_timer = 0.0
		increase_difficulty()

func spawn_enemy(pos: Vector2):
	if enemy_scene == null:
		return
	var enemy = enemy_scene.instantiate()
	enemy.position = pos
	enemy.fall_speed = fall_speed + randf_range(-50, 50)
	add_child(enemy)

func increase_difficulty():

	max_enemies = min(max_enemies + 1, 14)
	timers.append(randf_range(1.0, max_interval))

	min_interval = max(0.3, min_interval - 0.4)
	max_interval = max(0.6, max_interval - 0.5)

	fall_speed = min(1200.0, fall_speed + 80)
	print("Difficulty up! Streams: ", max_enemies, " Interval: ", min_interval, "-", max_interval, " Speed: ", fall_speed)
