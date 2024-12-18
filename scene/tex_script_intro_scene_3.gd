extends RichTextLabel
var ratio=0
@export var speed=0.01
@onready var timer = $"../Timer_lauch_real_game"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ratio=ratio+speed*delta
	visible_ratio=ratio
	if !$"../AudioStreamPlayer".playing and visible_ratio<1:
		$"../AudioStreamPlayer".play()
	if visible_ratio>0.99:
		$"../Button_2".visible = true
	


func _on_timer_timeout() -> void:
	visible_ratio=0.036
	timer.start()


func _on_timer_lauch_real_game_timeout() -> void:
	get_tree().change_scene_to_file("res://scene/new_main.tscn")
