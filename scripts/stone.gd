extends CharacterBody2D

@export var speed = 150 
#this means that the further along the stones are, the faster they get
var health = 3 #change this for changing enemy health
var health_ui : Label
var money_ui : Label
var breaksoundeffect : AudioStreamPlayer
var elapsed_time = 0.0 #measured amount of time between speed changes
func _ready() -> void:
	add_to_group("enemies")
	health_ui = get_node("/root/game/HealthUI/HealthCounter")
	money_ui = get_node("/root/game/MoneyUI/MoneyCounter")
	breaksoundeffect = get_node("/root/game/breaksoundeffect")

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() +speed*delta)
	if get_parent().get_progress_ratio() >= 1:
		queue_free()
		if health_ui:
			health_ui._on_enemy_reached_end()
		print("enemy reached end")
		
	if health <= 0:
		if money_ui:
			money_ui._on_enemy_killed()
		breaksoundeffect.play()
		get_parent().get_parent().queue_free() #gets rid of enemy when health is zero
		
		
func set_speed(new_speed):
	speed = new_speed
