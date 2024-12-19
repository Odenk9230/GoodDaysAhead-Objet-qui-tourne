extends Face

@export var led: MeshInstance3D
@export var begin: Color
@export var win: Color
@export var loose: Color
@export var anim : AnimationPlayer
@export var Sprite : AnimatedSprite3D
@export var label: Label3D
@export var punchtimer: Timer
var canpunch = false
var conteur = 0

func _face_on():
	led.mesh.surface_get_material(0).set_emission(begin)
	punchtimer.start()
	canpunch = true
	pass

func _face_off():
	pass

func _process(delta: float) -> void:
	label.text = str(conteur)
	pass


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("clic_gauche") and canpunch:
		anim.play("CLICK")
		Sprite.play("default")
		conteur = conteur + 1
		label.text = str(conteur)
	pass # Replace with function body.


func _on_punchtimer_timeout() -> void:
	if conteur >= 30 :
		led.mesh.surface_get_material(0).set_emission(win)
		canpunch = false
		conteur = 30
	else:
		led.mesh.surface_get_material(0).set_emission(loose)
		conteur = 0
		punchtimer.start()
	pass # Replace with function body.
