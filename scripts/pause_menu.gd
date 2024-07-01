extends Control

@onready var game = $"../../game.gd"

func _on_Unpause_pressed():
	game.pauseMenu()

func _on_close_game_pressed():
	get_tree().quit()
