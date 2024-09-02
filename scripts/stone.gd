extends CharacterBody2D

@export var speed = 150
@export var speed_increase = 10 #speed increase change over that time
@export var speed_change_interval = 3 #speed increase over time
var health = 2 #change this for changing enemy health
var health_ui : Label
var elapsed_time = 0.0 #measured amount of time between speed changes
func _ready() -> void:
	health_ui = get_node("/root/game/HealthUI/HealthCounter")

func _process(delta):
	elapsed_time += delta

	if elapsed_time >= speed_change_interval:
		speed += speed_increase
		elapsed_time = 0  # reset elapsed time
		print("Speed increased to: ", speed)
	get_parent().set_progress(get_parent().get_progress() +speed*delta)
	if get_parent().get_progress_ratio() >= 1:
		queue_free()
		if health_ui:
			health_ui._on_enemy_reached_end()
		print("enemy reached end")
		
	if health <= 0:
		get_parent().get_parent().queue_free() #gets rid of enemy when health is zero

