extends RichTextLabel

var ratio=0
@export var speed=0.01

var do_once = true
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print("yepeee")
	ratio=ratio+speed*delta
	visible_ratio=ratio
	if !$"../AudioStreamPlayer".playing and visible_ratio<1:
		$"../AudioStreamPlayer".play()
	if visible_ratio>0.99 and do_once:
		do_once = false
		$"../Button_2".visible = true
		$"../AudioStreamPlayer2".play()
