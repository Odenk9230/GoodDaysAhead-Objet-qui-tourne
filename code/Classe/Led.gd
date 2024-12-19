extends Node3D
class_name Led

@onready var modele = find_child("Circle")

@export var nothing: Color
@export var error: Color
@export var ongoing: Color
@export var succeed: Color = Color("488a1f")

enum ETATS {NOTHING, ERROR, ONGOING, SUCCEED}

var compteur_validation = 0.0
var seuil_validation = 120.0

var etat_actuel = ETATS.NOTHING

func _ready() -> void:
	passe_neutre()

func passe_neutre():
	if not etat_actuel == ETATS.SUCCEED :
		etat_actuel = ETATS.NOTHING
		modele.mesh.surface_get_material(0).set_emission(nothing)

func passe_erreur():
	etat_actuel = ETATS.ERROR
	modele.mesh.surface_get_material(0).set_emission(error)

func passe_en_cours():
	if not etat_actuel == ETATS.SUCCEED :
		etat_actuel = ETATS.ONGOING
		modele.mesh.surface_get_material(0).set_emission(ongoing)

func passe_valide():
	etat_actuel = ETATS.SUCCEED
	modele.mesh.surface_get_material(0).set_emission(succeed)

#func _process(delta: float) -> void:
	#if etat_actuel == ETATS.ONGOING :
		#compteur_validation += delta
		#if compteur_validation > seuil_validation :
			#passe_valide()
	#else :
		#if compteur_validation != 0.0 :
			#compteur_validation = 0
