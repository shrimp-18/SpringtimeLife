extends Node

var cutscene_scene = preload("res://scenes/beginning.tscn")

func play_cutscene():
	var cutscene_instance = cutscene_scene.instantiate()
	get_tree().get_root().add_child(cutscene_instance)  
