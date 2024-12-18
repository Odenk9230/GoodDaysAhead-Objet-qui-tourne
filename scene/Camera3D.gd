extends Camera3D
@export var player:CharacterBody3D
@export var smooth_speed: float


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = player.position.y
