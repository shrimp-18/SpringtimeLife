extends PathFollow2D

@export var speed: float = 50.0  # Adjust speed

func _process(delta):
	progress += speed * delta  # Moves along the path
