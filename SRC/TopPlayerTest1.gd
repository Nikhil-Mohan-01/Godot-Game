extends CharacterBody2D


const speed = 300.0

var left = false
var right = false
var up = false
var down = false

var friction = true

func _physics_process(delta):
	if left: 
		velocity.x -= speed * delta
	if right: 
		velocity.x += speed * delta
	if up: 
		velocity.y -= speed * delta
	if down: 
		velocity.y += speed * delta
	move_and_slide()
	
func _input(event):
	if event is InputEventKey:
		match event.keycode:
			KEY_A:
				left = event.pressed
			KEY_D:
				right = event.pressed
			KEY_W:
				up = event.pressed
			KEY_S:
				down = event.pressed

func _friction():
	if friction:
		velocity.x = lerp(velocity.x, 0.0, 0.1)

func _process(delta):
	_physics_process(delta)
	_friction()
