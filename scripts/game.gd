extends Node2D

@onready var pause_menu = $"CanvasLayer/Pause Menu"
var paused = false 
var openmouse : Texture2D = load("res://Sprites/kenney_cursor-pack/Vector/Basic/hand_open.svg")
var closedmouse : Texture2D = load("res://Sprites/kenney_cursor-pack/Vector/Basic/hand_closed.svg")
var openthemouse : bool = true
var mousedown : bool = false 
func _ready():
	Input.set_custom_mouse_cursor(openmouse)
#var TimeBetweenRounds = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #all of this is for making the mouse change when m1 is up or down
	if Input.is_action_pressed("leftclick") != mousedown:
		if (Input.is_action_pressed("leftclick")):
			Input.set_custom_mouse_cursor(closedmouse)
			openthemouse = false
		else:
			Input.set_custom_mouse_cursor(openmouse)
			openthemouse = true
			
		mousedown = Input.is_action_pressed("leftclick")
		
#	if Input.is_action_just_pressed("pausemenu"):
#		pauseMenu()
func pauseMenu(): #pause menu - broken
	paused = !paused
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1 
	else:
		pause_menu.show()
		Engine.time_scale = 0
	

#func _ready(): # i was originally going to have round system but removed it
#	Game()
#
#func Game():
#	print("Round 1 startin now")
#	#Run 1st round
#	await get_tree().create_timer(TimeBetweenRounds).timeout
#	print("Round 2 startin now")
#	#Run 2nd round
#	await get_tree().create_timer(TimeBetweenRounds).timeout
#	print("Round 3 startin now")
#	#Run 3rd round
#	await get_tree().create_timer(10).timeout
#	print("Round 4 startin now")
#	#Run 4th round
