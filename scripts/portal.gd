extends Area2D
@onready var anim=get_node("AnimatedSprite2D")

func _ready():
	anim.play("portal")

func _on_body_entered(body):
	if body is Player:
		if get_tree().current_scene.scene_file_path == "res://scenes/game.tscn":
			get_tree().change_scene_to_file("res://scenes/level2.tscn")
			GameController.total_health=100
		elif get_tree().current_scene.scene_file_path=="res://scenes/level2.tscn":
			get_tree().change_scene_to_file("res://scenes/level3.tscn")
			GameController.total_health=100
		elif get_tree().current_scene.scene_file_path=="res://scenes/level3.tscn":
			get_tree().change_scene_to_file("res://scenes/level4.tscn")
			GameController.total_health=100
