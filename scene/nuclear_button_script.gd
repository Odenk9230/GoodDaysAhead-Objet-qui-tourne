extends Node3D
@export var anim : AnimationPlayer
@export var Sprite : AnimatedSprite3D
var conteur = 0
@export var led: MeshInstance3D
# # Called when the node enters the scene tree for the first time.
# func _ready() -> void:
# 	pass # Replace with function body.


# # Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta: float) -> void:
# 	pass


# func _on_area_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
# 	if Input.is_action_just_pressed("clic_gauche"):
# 		print("Click")
# 		anim.play("CLICK")
# 		Sprite.play("default")
# 		conteur = conteur + 1
# 		$"../../retro_screen2/Label3D".text = str(conteur)


# func _on_punchtimer_timeout() -> void:
# 	if conteur > 50 :
# 		led
# 	pass # Replace with function body.
