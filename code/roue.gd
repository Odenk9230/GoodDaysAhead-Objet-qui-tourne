extends MeshInstance3D

var accelerotation : float

var intervalle_frein = 5
var compteur = 0

func _faire_tourner(puissance):
	puissance += randf_range(5.0,15.0)
	accelerotation += puissance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if accelerotation > 0:
		#rotate_x(accelerotation * delta)
		#if int(rotation_degrees.x) % 60 < 5 or int(rotation_degrees.x) % 60 > 55 :
			#if accelerotation < 5 :
				#accelerotation = - accelerotation
			#accelerotation *= 0.8
	if abs(accelerotation) > 0.0 :
		rotate_x(accelerotation * delta)
		accelerotation *= 0.98
	

func _on_pointeur_area_entered(area: Area3D) -> void:
	if abs(accelerotation) > 0.0 :
		accelerotation -= 0.1
		if abs(accelerotation) > 1.0 :
			print(accelerotation)
		else :
			accelerotation =- accelerotation
		
