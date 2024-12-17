extends Node3D

@onready var gestionnaire_dodecaedre = $GestionnaireDodecaedre

@onready var cam = $Camera3D

@onready var pcams : Array[Node] = get_tree().get_nodes_in_group("pcam_face")

@onready var pcam_host : PhantomCameraHost = $Camera3D/PhantomCameraHost

@onready var face_active : Face

var distance_max : float = 3.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gestionnaire_dodecaedre.arret.connect(_on_arret_rotation)

func _on_arret_rotation():
	var distance_min
	var pcam_proche : PhantomCamera3D
	
	for pcam in pcams :
		var distance : float = (pcam.global_position - cam.global_position).length()
		if distance < distance_max :
			if !distance_min :
				distance_min = distance
				pcam_proche = pcam
			elif distance < distance_min :
				distance_min = distance
				pcam_proche = pcam
	
	if pcam_proche :
		pcam_proche.set_priority(10)
		face_active = pcam_proche.get_parent()
		face_active._face_on()

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		var pcam_active : PhantomCamera3D = pcam_host.get_active_pcam()	
		if pcam_active.is_in_group("pcam_face") :
			pcam_active.set_priority(0)
			face_active._face_off()
			face_active = null
		
