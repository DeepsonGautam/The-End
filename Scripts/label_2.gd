extends Label

const SAVE_PATH = "user://highscore.dat"

func _ready():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var high_score = file.get_float()
		var minutes = int(high_score) / 60
		var seconds = int(high_score) % 60
		text = "Best | %02d:%02d" % [minutes, seconds]
	else:
		text = "Best | 00:00"
