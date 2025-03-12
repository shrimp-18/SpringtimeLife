extends ParallaxLayer

@export var scrolling_speed: float = 120

func _process(delta: float) -> void:
	motion_offset.x -= scrolling_speed * delta
