extends Node2D

@onready var pause_menu = $"CanvasLayer/Pause Menu"
var paused = false 

var TimeBetweenRounds = 5
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
	

func _ready():
	Game()

func Game():
	print("Round 1 startin now")
	#Run 1st round
	await get_tree().create_timer(TimeBetweenRounds).timeout
	print("Round 2 startin now")
	#Run 2nd round
	await get_tree().create_timer(TimeBetweenRounds).timeout
	print("Round 3 startin now")
	#Run 3rd round
	await get_tree().create_timer(10).timeout
	print("Round 4 startin now")
	#Run 4th round
