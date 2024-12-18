extends CanvasLayer

@onready var timer = $"../Timer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	$Control/Sprite2D.visible = true
	$"../RichTextLabel".visible = false
	timer.start()


func _on_timer_timeout() -> void:
	$"../Cat_Normal".visible = false
	$"../WRONG".visible = true
