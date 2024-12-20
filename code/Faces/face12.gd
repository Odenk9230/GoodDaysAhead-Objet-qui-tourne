extends Face

var canquit: bool = false
@export var canexit: Timer 
var isClicked: bool = false
var time = 0.0
var duration = 3.0
@onready var son = $AudioStreamPlayer3D
@onready var bouton_son = $boutonson

@onready var timer2 = $Timer

func _ready() -> void:
	pass 

func _face_on():
	canexit.start()
	pass

func _face_off():
	canquit = false
	canexit.stop()  # Stoppe le timer si la face est désactivée


func _process(delta: float) -> void:
	if isClicked:
		if time < duration:
			time += delta
			$exit/exit_button.position.y = lerp($exit/exit_button.position.y,-0.1,time/duration)
		else : 
			exit()
	pass


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if Input.is_action_just_pressed("clic_droit") and canquit:
		isClicked = true
		bouton_son.play()
	pass # Replace with function body.


func _on_can_exit_timeout() -> void:
	canquit = true
	pass # Replace with function body.

func exit() -> void:
	get_tree().quit()


func _on_boutonson_finished() -> void:
	timer2.start()


func _on_timer_timeout() -> void:
	son.play()
