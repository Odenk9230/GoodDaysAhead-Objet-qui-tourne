extends Area3D
class_name CaseRoue

@export_range(1,6) var numero_case : int 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_debut_roue()

func _debut_roue():
	set_collision_layer_value(5, false)
	position.y = -0.15

func _arret_roue():
	set_collision_layer_value(5, true)
	position.y = 0.0
