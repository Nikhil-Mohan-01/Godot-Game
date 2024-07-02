extends RigidBody2D

@onready var Player1 = get_parent().get_node("Player1")
@onready var Player2 = get_parent().get_node("Player2")

func _ready():
	pass

func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	print("Body Entered:", body.name)  # Debug print to check if the function is called
	if body == Player1 and Input.is_key_pressed(KEY_E):
		print("P1 Picked")
	if body == Player2 and Input.is_key_pressed(KEY_U):
		print("P2 Picked")
