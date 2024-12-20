extends MeshInstance3D

var accelerotation : float

var intervalle_frein = 5
var compteur = 0

@onready var son = $AudioStreamPlayer3D

var tourne = false

signal arret
signal debut_tourne


func _faire_tourner(puissance):
	if puissance > 0.0 :
		puissance += randf_range(0.0,20.0)
	elif puissance < 0.0 :
		puissance -= randf_range(0.0,20.0)
	accelerotation += puissance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if accelerotation > 0:
		#rotate_x(accelerotation * delta)
		#if int(rotation_degrees.x) % 60 < 5 or int(rotation_degrees.x) % 60 > 55 :
			#if accelerotation < 5 :
				#accelerotation = - accelerotation
			#accelerotation *= 0.8
	if abs(accelerotation) > 0.03 :
		if !tourne :
			tourne = true
			_on_tourne()
			debut_tourne.emit
			son.play()
			son.volume_db = 0
		rotate_x(accelerotation * delta)
		accelerotation *= 0.99
		son.volume_db -= 0.08
		print(accelerotation)
	
	elif tourne :
		tourne = false
		arret.emit
		accelerotation = 0.0
		_on_arret()
		son.stop()

func _on_pointeur_area_entered(area: Area3D) -> void:
	if !area.is_in_group("case_roue"):
		if abs(accelerotation) > 0.01 :
			accelerotation -= 0.1
			if abs(accelerotation) < 1.5 :
				accelerotation =- accelerotation
		

func _on_arret():
	get_tree().call_group("case_roue","_arret_roue")
	
func _on_tourne():
	get_tree().call_group("case_roue","_debut_roue")
