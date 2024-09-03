extends Label

var player_health = 200
var health = "HEALTH: "
func _ready():
	health_display_update()
	
func health_display_update() -> void:
	set_text(health+str(player_health))

func _on_enemy_reached_end() -> void:
	player_health -= 1
	health_display_update()
