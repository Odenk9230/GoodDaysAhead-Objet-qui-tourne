extends Area3D

var velocite : Vector3
var acceleration : Vector3
var dir: float = 1
var minPos: float = -0.616
var maxPos: float = 0.344
@export var isPushing: bool = false
@export var canClick: bool = true
@export var animPlayer: AnimationPlayer

	
func _process(delta: float) -> void:
	if isPushing:
		_appliquer_force(Vector3(0,0,0.01))
	else :
		_appliquer_force(Vector3(0,0,-0.0004))
	if position.z <= minPos:
		position.z = minPos
		velocite.z = 0
		acceleration.z = 0
	if position.z >= maxPos:
		position.z = maxPos
	velocite += acceleration * dir
	position += velocite
	acceleration = acceleration * 0
	
func _appliquer_force(force : Vector3):
	acceleration += force
	
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pushing"):
		isPushing = true
	if Input.is_action_just_released("pushing"):
		isPushing = false


func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed()  and canClick:
		isPushing = true
		animPlayer.play("CLICK") # Assurez-vous que "click" est le nom exact de votre animation
		canClick = false
	pass # Replace with function body.
