extends Area3D

func _on_body_entered(body):
	if body.is_in_group("player"):
		Engine.time_scale = 0.5
		await get_tree().create_timer(0.5).timeout
		Engine.time_scale = 1
		$"../../telly_controller".position = Vector3(-0.345, 0.141, -18.96)
		$"../../telly_controller".rotation = Vector3(0.0, 0.0, 0.0)
		$"../../../..".gestionnaire_dedocaedre.main._go_to_main_view()
