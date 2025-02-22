extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")

func _ready():
	anim.play("coin")


func _on_area_2d_body_entered(body):
	if body is player:
		GameController.coin_collected(value)
		self.queue_free()
