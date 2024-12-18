extends Face

@onready var roue = $MeshRoue

var relache = false
var appui = false
var dose_appui : float = 0.0

var active = false

func _ready() -> void:
	pass

func _face_on():
	active = true

func _face_off():
	active = false

func _process(delta: float) -> void:
	if appui :
		if roue.position.x > -0.1 :
			roue.position.x -= delta*0.03
			dose_appui += delta
	
	if relache :
		if roue.position.x < -0.05:
			roue.position.x += delta * 0.1
			dose_appui -= delta *3.0
		else :
			relache = false
			dose_appui = 0.0
		

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("clic_droit") and active and !relache and !appui:
		appui = true
	if Input.is_action_just_released("clic_droit") and appui :
		appui = false
		relache = true
		roue._faire_tourner(dose_appui*10)
