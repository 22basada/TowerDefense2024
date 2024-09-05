extends Node2D

#@onready var pause_menu = $"CanvasLayer/Pause Menu"
var paused = false 
var openmouse : Texture2D = load("res://Sprites/kenney_cursor-pack/Vector/Basic/hand_open.svg")
var closedmouse : Texture2D = load("res://Sprites/kenney_cursor-pack/Vector/Basic/hand_closed.svg")
var openthemouse : bool = true
var mousedown : bool = false 
var speed_elapsed_time = 0.0
var speed_change_interval = 3 # 3
var speed_increase = 12 # 12
var initial_speed = 150 # 150
var current_speed = initial_speed
var ambientmusic : AudioStreamPlayer


func _ready():
	Input.set_custom_mouse_cursor(openmouse)
	ambientmusic = get_node("/root/game/ambient_music")
	ambientmusic.play()

func _process(delta): #all of this is for making the mouse change when m1 is up or down
	if Input.is_action_pressed("leftclick") != mousedown:
		if (Input.is_action_pressed("leftclick")):
			Input.set_custom_mouse_cursor(closedmouse)
			openthemouse = false
		else:
			Input.set_custom_mouse_cursor(openmouse)
			openthemouse = true
			
		mousedown = Input.is_action_pressed("leftclick")
		
		
	speed_elapsed_time += delta
	if speed_elapsed_time >= speed_change_interval:
		speed_elapsed_time = 0  # reset elapsed time
		current_speed += speed_increase
		update_all_stones_speed()
		
func update_all_stones_speed():
	for stone in get_tree().get_nodes_in_group("enemies"):
		if stone.has_method("set_speed"):
			stone.set_speed(current_speed)
			print("Stone speed changed to: ", current_speed)
			
#	if Input.is_action_just_pressed("pausemenu"):
#		pauseMenu()
#func pauseMenu(): #pause menu - broken
#	paused = !paused
#	if paused:
#		pause_menu.hide()
#		Engine.time_scale = 1 
#	else:
#		pause_menu.show()
#		Engine.time_scale = 0
