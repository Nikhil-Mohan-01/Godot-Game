extends Node2D 

@onready var countdown_timer = $Timer 
var countdown_time = 30

func _ready():
	countdown_timer.connect("timeout", Callable(self, "_on_CountdownTimer_timeout"))
	countdown_timer.start()
	_update_timer_display()

func _on_CountdownTimer_timeout():
	if countdown_time > 0:
		countdown_time -= 1
		_update_timer_display()
		if countdown_time == 0:
			print("Time's up!") 
	else:
		countdown_timer.stop()

func _update_timer_display():
	print("Time left: %d seconds" % countdown_time)
