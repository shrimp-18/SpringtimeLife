extends Node2D
@onready var bgcarousel=$ScrollContainer
@onready var coin_label=$Label
var total_coins
@onready var sb=$soundd
var sound=preload("res://scenes/Untitled design (13).png")
var mute=preload("res://scenes/Untitled design (14).png")
func _ready():
	total_coins = GameController.total_coins
	
	
	
	coin_label.text = str(GameController.total_coins)
	bgcarousel.background_selected.connect(_on_bg_selected)
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

func _on_bg_selected(index):
	print("Background selected in Store:", index)
	GameController.selected_background_index = index  
	
func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")


func _on_soundd_pressed() -> void:
	if(sb.texture_normal==sound):
		sb.texture_normal=mute
		AudioStreamPlayer2d.stop()
	else :
		sb.texture_normal=sound
		AudioStreamPlayer2d.play()
