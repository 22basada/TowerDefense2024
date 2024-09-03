extends Label

var cash = 100
var dollarsign = "$ "
func _ready():
	cash_display_update()
	
func cash_display_update() -> void:
	set_text(dollarsign+str(cash))

func _on_enemy_killed() -> void:
	cash += 1
	cash_display_update()
	
func _on_tower_placed() -> void:
	cash -= 5
	cash_display_update()
