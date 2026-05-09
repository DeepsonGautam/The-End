extends Label

var high_score = 0.0
const SAVE_PATH = "user://highscore.dat"

func _ready():
	load_score()

func update_score(time):
	if time > high_score:
		high_score = time
		save_score()
	var minutes = int(high_score) / 60
	var seconds = int(high_score) % 60
	text = "Best | %02d:%02d" % [minutes, seconds]

func save_score():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_float(high_score)

func load_score():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		high_score = file.get_float()
	update_score(0)
