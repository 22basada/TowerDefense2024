extends CharacterBody2D


var target
var speed = 400
var pathName = ""
var dartDamage

func _physics_process(delta):
	
	velocity = global_position.direction_to(target)* speed
	
	look_at(target)
	
	move_and_slide()
