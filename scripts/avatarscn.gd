extends Node2D
@onready var carousel =$ScrollContainer

func _ready():
	carousel.player_selected.connect(_on_player_selected)

func _on_player_selected(index):
	print("Player selected in Avatar Selection:", index)
	GameController.selected_player_index = index  

func _on_quit_pressed():
	get_tree().quit()


func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_male_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/carouselplayermale.tscn")
	


func _on_female_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/carouselplayermale.tscn")


func _on_texture_button_pressed() -> void:
	carousel.select_player()
