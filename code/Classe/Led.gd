extends Node3D
class_name Led

@onready var modele = find_child("Circle")

@export var nothing: Color
@export var error: Color
@export var ongoing: Color
@export var succeed: Color = Color("488a1f")

enum ETATS {NOTHING, ERROR, ONGOING, SUCCEED}

var etat_actuel = ETATS.NOTHING

func _ready() -> void:
	passe_neutre()

func passe_neutre():
	etat_actuel = ETATS.NOTHING
	modele.mesh.surface_get_material(0).set_emission(nothing)

func passe_erreur():
	etat_actuel = ETATS.ERROR
	modele.mesh.surface_get_material(0).set_emission(error)

func passe_en_cours():
	etat_actuel = ETATS.ONGOING
	modele.mesh.surface_get_material(0).set_emission(ongoing)

func passe_valide():
	etat_actuel = ETATS.SUCCEED
	modele.mesh.surface_get_material(0).set_emission(succeed)
