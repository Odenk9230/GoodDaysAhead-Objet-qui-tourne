extends Face


func _ready() -> void:
	pass 

func _face_on():
	$MeshInstance3D.scale = Vector3(2,2,2)

func _face_off():
	$MeshInstance3D.scale = Vector3(1,1,1)

func _process(delta: float) -> void:
	pass
