extends Control
#pause menu - it was broken so the pause menu feature was removed
@onready var game = $"../../"

func _on_unpause_pressed():
	game.pauseMenu()

func _on_close_game_pressed():
	get_tree().quit()
