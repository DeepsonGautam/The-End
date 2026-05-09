extends Label

var glitching = false
var glitch_timer = 0.0
var original_pos

func _ready():
	original_pos = position

func start_glitch():
	glitching = true

func _process(delta):
	if not glitching:
		return
	
	glitch_timer += delta
	position = original_pos + Vector2(randf_range(-10, 10), randf_range(-5, 5))
	modulate = Color(randf_range(0.5, 1.0), 0, 0, 1)
	
	if glitch_timer > 1.0:
		glitching = false
		position = original_pos
		modulate = Color(1, 1, 1, 1)
