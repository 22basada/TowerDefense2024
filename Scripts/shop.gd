extends CanvasLayer

@onready var shop = $"CanvasLayer/Shop"
var hidden = false 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("tab") and hidden == true:
		show()
		hidden = false
	elif Input.is_action_just_pressed("tab") and hidden == false:
		hide()
		hidden = true
