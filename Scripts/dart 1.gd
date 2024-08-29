extends CharacterBody2D


var target
var speed = 500 #change this for speed of enemies
var pathName = ""
var dart_damage

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("game/PathSpawner")
	
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
	
	velocity = global_position.direction_to(target)* speed #velocity is speed and direction
	
	look_at(target) #when dart is going to enemy it is in the right orientation
	
	move_and_slide() #makes the dart go to enemy 


func _on_area_2d_body_entered(body):
	if "stone" in body.name:
		body.health -=dart_damage #dart damages enemy when in contact then disappears
		queue_free() 
