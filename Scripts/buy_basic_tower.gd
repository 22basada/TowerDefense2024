extends Panel

@onready var tower = preload("res://prefabs/dart_monkey.tscn")
var currentTile
var money_ui : Label
var moneysoundeffect : AudioStreamPlayer
func _ready() -> void:
	money_ui = get_node("/root/game/MoneyUI/MoneyCounter")
	moneysoundeffect = get_node("/root/game/moneysoundeffect")
	
func _on_gui_input(event):
	var tempTower = tower.instantiate()
	if event is InputEventMouseButton and event.button_mask == 1:
		print("m1 pressed") 
		add_child(tempTower) #checks is mouse is pressed for dragging the tower 
		
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
	if event is InputEventMouseMotion and event.button_mask == 1:
		if get_child_count() > 1:
			get_child(1).global_position = event.global_position #drags tower with mouse
		
	elif event is InputEventMouseButton and event.button_mask == 0:
		print("m1 released")
		if event.global_position.x <= 0:
			if get_child_count() > 1:
				get_child(1).queue_free() #drops tower where mouse is released
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
				
			var path = get_tree().get_root().get_node("game/AllTowers")
			
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			if money_ui:
				money_ui._on_tower_placed()
				moneysoundeffect.play()
			tempTower.get_node("Area").hide() #i was going to add it so when tower is being dragged, you can see its range
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
