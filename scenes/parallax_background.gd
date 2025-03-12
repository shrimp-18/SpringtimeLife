extends ParallaxBackground

@onready var camera := $"../Camera2D"  # Adjust if needed

func _process(delta):
	if camera:
		scroll_offset.x = camera.position.x  # Moves based on camera position
