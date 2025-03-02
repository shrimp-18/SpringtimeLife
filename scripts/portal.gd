extends Area2D
@onready var anim=get_node("AnimatedSprite2D")

func _ready():
	anim.play("portal")

func _on_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file("res://scenes/level2.tscn")
