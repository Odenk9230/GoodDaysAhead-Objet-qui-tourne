extends Face

var canJump: bool = true
var clicked: bool = false
@export var button: Area3D
var time = 0.0
var duration = 0.5
var returntimer = 0.0
var dur = 0.5

@onready var son = $AudioStreamPlayer3D
@onready var timer = $Timer

func _ready() -> void:
	pass 

func _face_on():
	clicked = false
	pass

func _face_off():
	pass

func _process(delta: float) -> void:
	if clicked:
		if time < duration:
			time += delta
			button.position.x = lerp(button.position.x,-0.09,time/duration)
		if time >= duration:
			if returntimer < dur:
				returntimer += delta
				button.position.x = lerp(button.position.x,-0.07,returntimer/dur)
				DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			else:
				clicked = false
				time = 0.0
				returntimer = 0.0
				pass
		else : 
			pass
	# if canClick
	pass


func _on_area_3d_input_event(_camera:Node, _event:InputEvent, _event_position:Vector3, _normal:Vector3, _shape_idx:int) -> void:
	if Input.is_action_just_pressed("clic_droit") and !clicked:
		clicked = true
		timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	son.play()
