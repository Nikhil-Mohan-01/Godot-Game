extends RigidBody2D

@onready var Player1 = get_parent().get_node("TopPlayerTest1")

var picked = false

func _ready():
	pass

func _process(delta):
	if picked == true:
		position = Player1.position

func _on_area_2d_body_entered(body):
	print("Body Entered:", body.name)
	picked = true
