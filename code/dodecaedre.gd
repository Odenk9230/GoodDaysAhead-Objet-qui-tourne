extends Node3D

var accelerotation : Vector2
@export var sensibilite := 0.1

var clique := false

signal arret

@onready var main = get_parent()

@onready var dodecaedre = get_child(0)




func _physics_process(delta: float) -> void:
	
	dodecaedre.rotate_y(accelerotation.x * delta)
	dodecaedre.rotate_z(-accelerotation.y * delta)
	

	
	accelerotation *= 0.8

func _on_area_3d_area_entered(area: Area3D) -> void:
	print("C'est bon ça marche peut etre")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("clic_gauche"):
		clique = true
	
	if Input.is_action_just_released("clic_gauche"):
		if !$"..".face_active :
			clique = false
			arret.emit()
		
		
	
	if event is InputEventMouseMotion:
		if clique :
			accelerotation += event.relative * sensibilite
