extends Control

@onready var game = $"../../"

func _on_unpause_pressed():
	game.pauseMenu()

func _on_close_game_pressed():
	get_tree().quit()
