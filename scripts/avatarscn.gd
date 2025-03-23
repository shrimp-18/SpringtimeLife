extends Node2D
@onready var carousel =$ScrollContainer
@onready var carouselm=$ScrollContainer2

func _ready():
	carousel.player_selected.connect(_on_player_selected)
	match GameController.selected_background_index:
		0:
			GlobalParallaxBackground.visible=true
			ParallaxBackgroundd.visible=false
		1:
			ParallaxBackgroundd.visible=true
			GlobalParallaxBackground.visible=false

func _on_player_selected(index):
	print("Player selected in Avatar Selection:", index)
	GameController.selected_player_index = index  

func _on_quit_pressed():
	get_tree().quit()

func _on_texture_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_male_pressed() -> void:
	
	carouselm.visible = true
	carousel.visible = false

func _on_female_pressed() -> void:
	carouselm.visible = false
	carousel.visible = true


func _on_texture_button_pressed() -> void:
	carousel.select_player()
	
