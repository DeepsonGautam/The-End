extends Control

func _on_start_pressed() -> void:
	$VBoxContainer/Pressed.play()
	get_tree().change_scene_to_file("res://Scene/world.tscn")
	
func _on_options_pressed() -> void:
	$VBoxContainer/Pressed.play()
	$VBoxContainer.visible = false
	$Panel2.visible = true
	
func _on_exit_pressed() -> void:
	$VBoxContainer/Pressed.play()
	get_tree().quit()

#Hover Sound
func _on_start_mouse_entered() -> void:
	$VBoxContainer/Hover.play()

func _on_options_mouse_entered() -> void:
	$VBoxContainer/Hover.play()
	
func _on_exit_mouse_entered() -> void:
	$VBoxContainer/Hover.play()


func _on_back_pressed() -> void:
	$VBoxContainer/Pressed.play()
	$VBoxContainer.visible = true
	$Panel2.visible = false
	
