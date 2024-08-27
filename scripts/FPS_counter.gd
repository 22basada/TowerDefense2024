extends Label

func _process(delta: float) -> void:
	set_text(str(Engine.get_frames_per_second())) #fps counter in top left corner
