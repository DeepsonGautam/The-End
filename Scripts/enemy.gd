extends Area2D

var fall_speed = 200.0

func _process(delta):
	position.y += fall_speed * delta
	if position.y > get_viewport_rect().size.y + 50:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		$"/root/World/Music/GameOver".play()
		$"/root/World/CanvasLayer/Game Over".visible = true
		$"/root/World/CanvasLayer/Game Over".start_glitch()
		$"/root/World/ColorRect".visible = true
		$"/root/World/DeathMenu".show_menu()
		var timer = $"/root/World/CanvasLayer/TimerLabel"
		$"/root/World/CanvasLayer/HighScoreLabel".update_score(timer.survival_time)
		get_tree().paused = true
