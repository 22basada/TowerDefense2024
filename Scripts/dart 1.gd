extends CharacterBody2D


var target
var speed = 400
var pathName = ""
var dart_damage

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("game/PathSpawner")
	
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
	
	velocity = global_position.direction_to(target)* speed
	
	look_at(target)
	
	move_and_slide()


func _on_area_2d_body_entered(body):
	if "stone" in body.name:
		body.health -=dart_damage
		queue_free()
