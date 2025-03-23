extends Node2D
var save_path = "user://savegame.dat"
var total_coins:int
var total_fruits:int
var cutscene_scene = preload("res://scenes/beginning.tscn")
@onready var coin_label=$coinlabel
@onready var fruit_label=$"fruit label"
func _ready():
	match GameController.load_selected_background():
		0:
			GlobalParallaxBackground.visible=true
			ParallaxBackgroundd.visible=false
		1:
			ParallaxBackgroundd.visible=true
			GlobalParallaxBackground.visible=false
	total_coins = GameController.total_coins
	total_fruits = GameController.total_fruits
	print(GameController)
	print("coins :", GameController.total_coins)
	print("fruits :",GameController.total_fruits)
	load_date()
	coin_label.text = str(GameController.total_coins)
	fruit_label.text = str(GameController.total_fruits)
	get_tree().get_root().find_child("CoinUi", true, false).visible = false

func _on_quit_pressed():
	get_tree().quit()



func _on_playb_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_avatar_pressed():
	get_tree().change_scene_to_file("res://scenes/avatarscn.tscn")


func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/store.tscn")


func _on_house_pressed():
	get_tree().change_scene_to_file("res://scenes/myhouse.tscn")

func load_date():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		total_coins = file.get_var()
		total_fruits = file.get_var()
		file.close() 
		print("Data loaded successfully!")
		print("Coins:", total_coins)
		print("Fruits:", total_fruits)# Make sure to close the file after reading
	else:
		print("no data saved...")
		total_coins = 0
		total_fruits = 0


func _on_heart_pressed() -> void:
	print(get_tree())
	if get_tree():
		get_tree().change_scene_to_file("res://scenes/beginning.tscn")
	else:
		print("SceneTree is null!")
