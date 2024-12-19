extends Face

@onready var roue = $MeshRoue
@onready var pointeur = $Pointeur
@onready var led = $led

var relache = false
var appui = false
var dose_appui : float = 0.0

@onready var musique = $MeshRoue/Musique/Musique

var active = false

func _ready() -> void:
	pass

func _face_on():
	active = true
	if led.etat_actuel == 1:
		led.passe_neutre()

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
	if Input.is_action_just_pressed("clic_droit") and active and !roue.tourne:
		appui = true
	if Input.is_action_just_released("clic_droit") and appui :
		appui = false
		relache = true
		roue._faire_tourner(- dose_appui*20)


func _on_pointeur_area_entered(area: Area3D) -> void:
	if area.is_in_group("case_roue") :
		if !roue.tourne :
			match area.numero_case :
				1:
					roue._faire_tourner(-randf_range(1,15))
				2:
					if musique.playing :
						musique.stop()
					else :
						musique.play()
				3:
					gestionnaire_dedocaedre.main._go_to_main_view()
					led.passe_erreur()
				4:
					roue._faire_tourner(randf_range(1,15))
				5:
					print("SCReAMER")
				6:
					led.passe_valide()
		elif area.numero_case == 7:
			led.passe_en_cours()
	else :
		pointeur.appliquer_force(-roue.accelerotation * 0.5)


func _on_pointeur_area_exited(area: Area3D) -> void:
	if area.is_in_group("case_roue") :
		if area.numero_case == 7 and led.etat_actuel == 2:
			led.passe_neutre()
			
