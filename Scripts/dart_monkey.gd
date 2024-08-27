extends StaticBody2D

var dart = preload("res://prefabs/dart 1.tscn")
var dart_damage = 1 #how much damage the darts do to the enemies
var pathName 
var currentTargets = []
var current

func _process(delta):
	if is_instance_valid(current):
		self.look_at(current.global_position)
	else:
		for i in get_node("DartContainer").get_child_count():
			get_node("DartContainer").get_child(i).queue_free()

func _on_dart_monkey_area_body_entered(body):
	if "stone" in body.name:
		var tempArray = []
		currentTargets = get_node("DartMonkeyArea").get_overlapping_bodies()
		print(currentTargets) #this checks which enemy is in range
		
		for i in currentTargets:
			if "stone" in i.name:
				tempArray.append(i)
		var currentTargets = null
		
		for i in tempArray:
			if currentTargets == null:
				currentTargets = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currentTargets.get_progress():
					currentTargets = i.get_node("../")
		
		current = currentTargets
		pathName = currentTargets.get_parent().name
		
		var tempDart = dart.instantiate()
		tempDart.pathName = pathName
		tempDart.dart_damage = dart_damage
		get_node("DartContainer").add_child(tempDart)
		tempDart.global_position = $Aim.global_position


func _on_dart_monkey_area_body_exited(body):
	currentTargets = get_node("DartMonkeyArea").get_overlapping_bodies()
