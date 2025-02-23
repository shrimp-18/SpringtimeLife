extends Area2D

@export var value:int=1

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		GameController.fruit_collected(value)
		self.queue_free()
