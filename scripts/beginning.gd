extends Node
@onready var anima=$AnimationPlayer

func _ready():
	anima.play("opening")
	anima.connect("animation_finished", _on_cutscene_finished)

func _on_cutscene_finished(opening):
	get_tree().change_scene_to_file("res://scenes/home.tscn") 
