extends CharacterBody2D

@export var speed = 150

var health = 2
var playerhealth = 100
var time: float = 0.0
var seconds: int = 0

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() +speed*delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		print("enemy reached end")
		playerhealth -=1
		
	if health <= 0:
		get_parent().get_parent().queue_free()

