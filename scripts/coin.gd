extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")

func _ready():
	anim.play("coin")
