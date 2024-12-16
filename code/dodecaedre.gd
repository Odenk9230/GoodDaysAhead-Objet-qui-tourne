extends Node3D

var accelerotation : Vector2
var sensibilite := 0.03

@onready var hbras = $BrasHorizontal
@onready var vbras = $BrasHorizontal/BrasVertical

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _physics_process(delta: float) -> void:
	hbras.rotation.y += accelerotation.x * delta
	vbras.rotation.x -= accelerotation.y * delta
	accelerotation *= 0.8

func _on_area_3d_area_entered(area: Area3D) -> void:
	print("C'est bon ça marche peut etre")

func _unhandled_input(event: InputEvent) -> void:
		if event is InputEventMouseMotion:
			accelerotation += event.relative * sensibilite
