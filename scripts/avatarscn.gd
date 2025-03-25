extends Node2D
@onready var carousel =$ScrollContainer
@onready var carouselm=$ScrollContainer2
@onready var fruitlabel=$Label
func _ready():
	carousel.player_selected.connect(_on_player_selected)
	fruitlabel.text=str(GameController.total_fruits)
	match GameController.selected_background_index:
		0:
			GlobalParallaxBackground.visible=true
			ParallaxBackgroundd.visible=false
			ParallaxBackground3.visible=false
			ParallaxBackground4.visible=false
		1:
			ParallaxBackgroundd.visible=true
			GlobalParallaxBackground.visible=false
			ParallaxBackground3.visible=false
			ParallaxBackground4.visible=false
		2:
			ParallaxBackground3.visible=true
			ParallaxBackgroundd.visible=false
			GlobalParallaxBackground.visible=false
			ParallaxBackground4.visible=false
		3:
			ParallaxBackgroundd.visible=false
			GlobalParallaxBackground.visible=false
			ParallaxBackground3.visible=false
			ParallaxBackground4.visible=true

			
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
