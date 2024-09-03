extends Label

var cash = 650
var dollarsign = "$ "
var freemoney = 100
var freemoneytime = 15
var time = 0.0
func _ready():
	cash_display_update()

func _process(delta:float) -> void:
	time += delta
	if time >= freemoneytime:
		cash += freemoney
		time = 0.0
		cash_display_update()

func cash_display_update() -> void:
	set_text(dollarsign+str(cash))

func _on_enemy_killed() -> void:
	cash += 1
	cash_display_update()
	
func _on_tower_placed() -> void:
	cash -= 170
	cash_display_update()
