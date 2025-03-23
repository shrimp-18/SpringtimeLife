extends Node2D
@onready var bgcarousel=$ScrollContainer

func _ready():
	bgcarousel.background_selected.connect(_on_bg_selected)
	

func _on_bg_selected(index):
	print("Background selected in Store:", index)
	GameController.selected_background_index = index  
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")
