extends Label

var survival_time = 0.0

func _physics_process(delta):
	survival_time += delta
	var minutes = int(survival_time) / 60
	var seconds = int(survival_time) % 60
	text = "Time | %02d:%02d" % [minutes, seconds]
