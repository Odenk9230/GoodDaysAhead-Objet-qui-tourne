extends Face

var canquit: bool = false
@export var canexit: Timer 
func _ready() -> void:
	pass 

func _face_on():
	canexit.start()
	pass

func _face_off():
	canquit = false
	canexit.stop()  # Stoppe le timer si la face est désactivée


func _process(delta: float) -> void:
	pass


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("clic_droit") and canquit:
		get_tree().quit()
	pass # Replace with function body.


func _on_can_exit_timeout() -> void:
	canquit = true
	pass # Replace with function body.
