extends Area3D

func _on_body_entered(body):
	if body.is_in_group("player"):
		Engine.time_scale = 0.5
		await get_tree().create_timer(0.5).timeout
		Engine.time_scale = 1
		get_tree().reload_current_scene()
