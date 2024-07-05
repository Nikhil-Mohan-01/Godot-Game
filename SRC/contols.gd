extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(): ## Normal Player
	Global.player1 = true
	Global.frog1 = false


func _on_button_2_pressed():
	Global.player1 = false
	Global.frog1 = true


func _on_button_3_pressed():
	Global.player2 = true
	Global.frog2 = false


func _on_button_4_pressed():
	Global.player2 = false
	Global.frog2 = true


func _on_button_5_pressed():
	
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
