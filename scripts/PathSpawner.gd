extends Node2D

@onready var path = preload("res://prefabs/Track 1.tscn")

func _on_timer_timeout():
	var temp_path = path.instantiate()
	add_child(temp_path)
	print("enemy spawned") #spawns the enemies and prints
	var game = get_tree().get_root().get_node("game")
	if game and game.has_method("current_speed"):
		var speed = game.current_speed
		for child in temp_path.get_children():
			if child.is_in_group("AllTowers"):
				child.set_speed(speed)
	game.update_all_stones_speed()
