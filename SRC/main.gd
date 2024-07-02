extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.player1: 
		var player1 = preload("res://Scenes/player_1.tscn").instantiate()
		player1.position = Vector2(283, 356)
		add_child(player1)
	if Global.frog1: 
		var player1 = preload("res://Scenes/player_1_frog.tscn").instantiate()
		player1.position = Vector2(283, 356)
		add_child(player1)
	if Global.player2: 
		var player2 = preload("res://Scenes/player_2.tscn").instantiate()
		player2.position = Vector2(560, 356)
		add_child(player2)
	if Global.frog2: 
		var player2 = preload("res://Scenes/player_2_frog.tscn").instantiate()
		player2.position = Vector2(560, 356)
		add_child(player2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
