extends CharacterBody2D

const speed = 50

@onready var cam = $Camera2D
var miniMap = false

func _input(event):
	if event is InputEventKey:
		match event.keycode:
			KEY_M:
				miniMap = event.pressed
				

func _process(delta):
	position += Input.get_vector("left", "right", "up", "down") * speed * delta
	
	if miniMap:
		cam.global_position = Vector2(537, 238)
		cam.zoom = Vector2(1.025, 0.865)
	else:
		cam.position = position
		cam.zoom = Vector2.ONE * 7.875
