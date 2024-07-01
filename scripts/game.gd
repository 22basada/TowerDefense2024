extends Node2D

@onready var pause_menu = $"CanvasLayer/Pause Menu"
var paused = false 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pausemenu"):
		pauseMenu()
	
func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false 
	else:
		pause_menu.show()
		get_tree().paused = true
	paused = !paused

