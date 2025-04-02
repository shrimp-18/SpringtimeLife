extends Node

@onready var anima = $AnimationPlayer
@onready var player = $Path2D/PathFollow2D/player 
func _ready():
	
	if player.has_method("start_cutscene"):
		player.start_cutscene()
	
	anima.play("opening")
	anima.connect("animation_finished", _on_cutscene_finished)

func _on_cutscene_finished(_anim_name):
	
	if player.has_method("end_cutscene"):
		player.end_cutscene()
	
	get_tree().change_scene_to_file("res://scenes/home.tscn")  
