extends Face

var isMoving:bool = false
var canClick:bool = true
var maxPos: float = 0.377
var minPos: float = -0.357
var speed: float = 0.5
@export var jauge: Area3D
@export var led: MeshInstance3D
@export var notin: Color
@export var inthezone: Color
@export var win: Color
@export var timer: Timer
@export var button: Area3D
@export var animPlayer: AnimationPlayer
@export var pushed: Area3D
var time = 0.0
var duration = 2.0
var dir: float = 1

@onready var son_led = $led/AudioStreamPlayer3D
@onready var son_oop = $AudioStreamPlayer3D

func _ready() -> void:
	isMoving = false
	led.mesh.surface_get_material(0).set_emission(notin)
	pass 

func _face_on():
	jauge.position.z = minPos
	isMoving = true
	canClick = false
	pass
func _face_off():
	jauge.position.z =  minPos
	isMoving = false
	pass

func _process(delta: float) -> void:
	if isMoving:
		jauge.position.z += dir * speed * delta
		if jauge.position.z >= maxPos :
			dir = -1
		if jauge.position.z <= minPos :
			dir = 1
	if !timer.is_stopped() :
		son_oop.pitch_scale += delta*2
	pass

func _on_area_area_entered(area: Area3D) -> void:
	if area.is_in_group("control") and isMoving:
		led.mesh.surface_get_material(0).set_emission(inthezone)
		son_led.play()
		timer.start()
		son_oop.pitch_scale = 1.0
		son_oop.play()
	pass # Replace with function body.


func _on_area_area_exited(area: Area3D) -> void:
	if area.is_in_group("control") and isMoving:
		led.mesh.surface_get_material(0).set_emission(notin)
		timer.stop()
		son_led.play()
		son_oop.stop()
	pass # Replace with function body.


func _on_win_timer_timeout() -> void:
	led.mesh.surface_get_material(0).set_emission(win)
	isMoving = false
	son_led.play()
	son_oop.stop()
	pass # Replace with function body.
