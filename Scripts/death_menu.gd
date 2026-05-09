extends VBoxContainer

func _ready():
	visible = false
	modulate.a = 0.0

func show_menu():
	visible = true

func _process(delta):
	if visible and modulate.a < 1.0:
		modulate.a += delta * 0.8

func _on_main_menu_pressed():
	$"/root/World/Music/ButtonClick".play()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Scene/Main menu.tscn")

func _on_exit_pressed():
	$"/root/World/Music/UiPop".play()
	get_tree().quit()

func _on_main_mouse_entered() -> void:
	$"/root/World/Music/UiPop".play()

func _on_exit_mouse_entered() -> void:
	$"/root/World/Music/UiPop".play()
