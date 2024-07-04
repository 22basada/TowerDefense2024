extends Node2D

@onready var pause_menu = $"CanvasLayer/Pause Menu"
var paused = false 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pausemenu"):
		pauseMenu()
	
func pauseMenu():
	paused = !paused
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1 
	else:
		pause_menu.show()
		Engine.time_scale = 0
	

