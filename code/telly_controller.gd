extends CharacterBody3D

@export var Jump_Buffer_Timer: float = .1
const SPEED = 1.7
const JUMP_VELOCITY = 4.7
var Jump_Available:bool = true
var Jump_Buffer:bool = false
var direction = 1

@onready var ray_cast_right = $RaycastRight
@onready var ray_cast_left = $RaycastLeft

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var fall_gravity: float = 5.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		if velocity.y>0:
			velocity.y -= gravity * delta
		else:
			velocity.y -= fall_gravity * delta
	else:
		Jump_Available = true
		if Jump_Buffer:
			Jump()
			Jump_Buffer = false
	
	#if is_on_wall_only():
	#	Jump_Available = true
	#	if velocity.y>0:
	#			Jump_Available = false
	#else:
	#	Jump_Available = false

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if Jump_Available:
			Jump()
		else:
			Jump_Buffer = true
			get_tree().create_timer(Jump_Buffer_Timer).timeout.connect(on_jump_buffer_timeout)
	
	if ray_cast_right.is_colliding():
		direction = -1
		$telly_rig.rotation_degrees.y = -90
		
	if ray_cast_left.is_colliding():
		direction = 1
		$telly_rig.rotation_degrees.y = 90
		
	position.x += direction * SPEED * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("move_left", "move_right", "crouch", "jump")
	#var direction = (transform.basis * Vector3(input_dir.x, input_dir.y, 0)).normalized()
	#if direction:
	#	velocity.x = direction.x * SPEED
		
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
	
func Jump()->void:
	velocity.y = JUMP_VELOCITY
	Jump_Available = false
	
func on_jump_buffer_timeout()->void:
	Jump_Buffer = false
