extends Area3D

var accelerotation : float = 0.0

var limite : float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func appliquer_force(force):
	accelerotation += force

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rotation_degrees.z != 180.0 :
		if rotation_degrees.z < 180.0 :
			accelerotation + 1.0
		else :
			accelerotation - 1.0
		
	
	rotate_x(accelerotation * delta)
	accelerotation *= 0.9
	
	
