extends CharacterBody2D


const speed = 50

var friction = true

func _process(delta):
	position += Input.get_vector("left", "right", "up", "down") * speed * delta
