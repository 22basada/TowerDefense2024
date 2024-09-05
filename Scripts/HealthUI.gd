extends Label

var player_health = 50
var health = "Health:"
func _process(delta: float) -> void:
	set_text(str(health,player_health))

func _on_area_2d_body_entered(body):
	if "stone" in $DetectLoss:
		player_health -= 1
		set_text(str(health,player_health))
