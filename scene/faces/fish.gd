extends Area3D

var velocite : Vector3
@export var legerete_helium = 1.0
@export var puissance_vent = 1.0
var acceleration : Vector3
var dir: float = 1
var minPos: float = 0
var maxPos: float = 0.845
var isPushing: bool = false
	
func _process(delta: float) -> void:
	if position.z <= minPos:
		position.z = 0
		dir = 1
	if position.z >= maxPos:
		position.z = maxPos
		dir = -1
	if isPushing:
		_appliquer_force(Vector3(0,0,0.002))
	else :
		acceleration = Vector3(0,0,0)
		velocite  = Vector3(0,0,0)
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
