extends Face

@export var led: Node3D
@export var anim : AnimationPlayer
@export var Sprite : AnimatedSprite3D
@export var label: Label3D
@export var punchtimer: Timer

@onready var son_led = $led/AudioStreamPlayer3D

@onready var timer_anim = $Timer
@onready var son = $AudioStreamPlayer3D

var canpunch = false
var conteur = 0

func _face_on():
	if led.etat_actuel == 1:
		led.passe_neutre()
	punchtimer.start()
	canpunch = true
	pass

func _face_off():
	pass

func _process(_delta: float) -> void:
	label.text = str(conteur)
	pass


func _on_area_3d_input_event(_camera: Node, _event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if Input.is_action_just_pressed("clic_gauche") and canpunch:
		anim.play("CLICK")
		led.passe_en_cours()
		if timer_anim.is_stopped() :
			timer_anim.start()
		
		conteur = conteur + 1
		label.text = str(conteur)
	pass # Replace with function body.



func _on_punchtimer_timeout() -> void:
	if conteur >= 30 :
		led.passe_valide()
		canpunch = false
		conteur = 30
	else:
		led.passe_erreur()
		conteur = 0
		punchtimer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	Sprite.play("default")
	son.play()
