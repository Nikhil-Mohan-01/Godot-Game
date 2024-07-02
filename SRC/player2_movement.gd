extends CharacterBody2D

class_name tendulum
@onready var sprite = $Sprite2D
@onready var hitbox = $CollisionShape2D
@onready var pos = $Marker2D

# add arms after 
var SPEED = 500.0
var JUMP_VELOCITY = -500.0
var jump = false
var friction = true

# get default player gravity
var player_gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var pivot_point:Vector2  # this is the pivot point
var end_position:Vector2 = Vector2() 
var arm_length:float
var angle
var gravity = 0.4 * -60 # this gravity is for the pendulum physics only
var damping = 0.94 # idk why this value made it function the best
var angular_velocity = 0.0
var angular_acceleration = 0.0

func _input(event):
	if event is InputEventKey:
		match event.keycode:
			KEY_I:
				jump = event.pressed

func _physics_process(delta):
	#character classes
	if Global.player2:
		if not is_on_floor():
			velocity.y += player_gravity * delta # Ensure gravity is frame-rate independent

		if Input.is_key_pressed(KEY_I) and is_on_floor():
			print("Jumping!")  # Debug statement
			velocity.y = JUMP_VELOCITY

		if Input.is_key_pressed(KEY_J):
			velocity.x -= SPEED * delta
		if Input.is_key_pressed(KEY_L):
			velocity.x += SPEED * delta
		
		move_and_slide()

	elif Global.frog2:
		if jump and is_on_floor():
			velocity.x = cos(rotation - PI/2) * JUMP_VELOCITY
			velocity.y = sin(rotation - PI/2) * JUMP_VELOCITY

		if not is_on_floor():
			velocity.y += player_gravity * delta # Ensure gravity is frame-rate independent
		move_and_slide()
		_game_input()
		queue_redraw()
	
func _friction():
	if is_on_floor() and friction:
		velocity.x = lerp(velocity.x, 0.0, 0.2)
	else:
		if friction:
			velocity.x = lerp(velocity.x, 0.0, 0.1)

func set_start_position(start_pos:Vector2, end_pos:Vector2):
	pivot_point = pos.position
	end_position = end_pos
	arm_length = Vector2.ZERO.distance_to(end_position - pivot_point)
	angle = Vector2.ZERO.angle_to(end_position - pivot_point) - deg_to_rad(-90)
	angular_velocity = 0.0
	angular_acceleration = 0.0

func _ready():
	set_start_position(global_position, global_position)
	## Character classes can go here maybe
	if Global.player2:
		scale = Vector2(0.5, 1)
	elif Global.frog2: 
		scale = Vector2(0.25, 0.25)

func _add_angular_velocity(force:float) -> void:
	angular_velocity += force

func _game_input() -> void:
	if Global.frog2:
		var dlr:float = 0
		if Input.is_key_pressed(KEY_J):
			dlr += 1
		elif Input.is_key_pressed(KEY_L):
			dlr -= 1
		_add_angular_velocity((dlr * 0.3) * 0.02)

func _process(delta):
	if Global.player2:
		scale = Vector2(0.5, 1)
		rotation = 0
	elif Global.frog2: 
		scale = Vector2(0.25, 0.25)
		
	if Global.frog2:
		rotation = -angle
		angular_acceleration = ((-gravity * delta) / arm_length) * sin(angle)
		angular_velocity += angular_acceleration
		angular_velocity *= damping
		angle += angular_velocity
		end_position = pivot_point + Vector2(arm_length * sin(angle), arm_length * cos(angle))
	_physics_process(delta)
	_friction()
