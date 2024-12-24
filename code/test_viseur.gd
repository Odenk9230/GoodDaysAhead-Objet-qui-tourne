extends Area3D

@onready var hitbox = get_child(0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		hitbox.disabled = false
	if Input.is_action_just_released("ui_accept"):
		hitbox.disabled = true
