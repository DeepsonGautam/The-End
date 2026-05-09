extends HSlider

@export var audio_bus_name := "Music"

var audio_bus_id
func _on_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else: 
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
func _ready():
	audio_bus_id = AudioServer.get_bus_index(audio_bus_name)
	print(audio_bus_name)
	print(audio_bus_id)

func _on_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(
		audio_bus_id,
		linear_to_db(value)
	)
