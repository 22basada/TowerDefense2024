extends Node

var new_cursor = load("res://Sprites/kenney_cursor-pack/PNG/Basic/Default/pointer_b.png")

func _ready():
	Input.set_custom_mouse_cursor(new_cursor,Input.CURSOR_ARROW) 
