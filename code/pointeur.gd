extends Area3D

var accelerotation : float = 0.0

var limite : float = 120.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func appliquer_force(force : float):
	accelerotation += force

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("----------------------------------------------------------------
	#Accelerotation :" + str(accelerotation) + "
	#
	#Rotation x : " + str(rotation_degrees.x) + "
	#Rotation y : " + str(rotation_degrees.y) + "
	#Rotation z : " + str(rotation_degrees.z))
	
	rotate_x(accelerotation * delta)
	accelerotation *= 0.9
	
	if rotation_degrees.z != 180 :
		rotation.z = lerp_angle(rotation.z, deg_to_rad(180.0), 0.05)
