extends PathFollow2D

var speed = 0.096

func _process(delta):
	progress_ratio += speed * delta
