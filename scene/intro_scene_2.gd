extends Node3D

@onready var stream_clic = $AudioStreamClic

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	stream_clic.play()
	pass # Replace with function body.
