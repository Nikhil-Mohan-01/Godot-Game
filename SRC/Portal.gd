extends Area2D

@onready var Player1 = get_parent().get_node("Player1")
@onready var Player2 = get_parent().get_node("Player2")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print(body.name)
	if body == Player1:
		Global.frog1 = true
		Global.player1 = false
	if body == Player2:
		Global.frog2 = true
		Global.player2 = false
