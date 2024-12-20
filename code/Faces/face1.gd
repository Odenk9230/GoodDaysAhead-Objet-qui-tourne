extends Face

var clicked = false

@export var sensibilite = 1.0

@onready var potard = $Area3D/MeshInstance3D

var accelerotation : Vector2 = Vector2(0,0)

func _ready() -> void:
	pass 

func _face_on():
	pass

func _face_off():
	pass

func _process(delta: float) -> void:
	var mod_db = (accelerotation.x - accelerotation.y)*delta
	potard.rotate_y(accelerotation.x * delta)
	potard.rotate_y(-accelerotation.y * delta)
	AudioServer.set_bus_volume_db(0, AudioServer.get_bus_volume_db(0)+mod_db)
	accelerotation *= 0.3


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("clic_droit") and !clicked:
		clicked = true

func _unhandled_input(event: InputEvent) -> void: 
	if Input.is_action_just_released("clic_droit") and clicked:
		clicked = false
	
	if event is InputEventMouseMotion:
		if clicked :
			accelerotation += event.relative * sensibilite
