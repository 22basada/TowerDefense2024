extends CharacterBody2D

@export var speed = 80

var health = 1
var start_time = 0 
var elapsed_time = 0


func _process(delta):
	get_parent().set_progress(get_parent().get_progress() +speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		print("enemy reached end")
		
	if health <= 0:
		get_parent().get_parent().queue_free()


