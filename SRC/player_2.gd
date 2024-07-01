extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var friction = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_key_pressed(KEY_W) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_key_pressed(KEY_A):
		velocity.x -= SPEED * delta
	if Input.is_key_pressed(KEY_D):
		velocity.x += SPEED * delta

	move_and_slide()

func _friction():
	if is_on_floor() and friction == true:
		velocity.x = lerp(velocity.x, 0.0, 0.2)
	else:
		if friction == true:
			velocity.x = lerp(velocity.x, 0.0, 0.1)

func _process(delta):
	_physics_process(delta)
	_friction()
