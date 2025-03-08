extends Node2D

var save_path="user://variable.save"
@export var total_coins

var1=total_coins

func _on_quit_pressed():
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func save():
	var file= FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(total_coins)
	file.store_var(GameController.coin_collected(value))
	
func load_date():
	if FileAccess.file_exists(save_path):
		var file=FileAccess.open(save_path,FileAccess.READ)
		GameController.fruit_collected(value)=file.get_var(GameController.fruit_collected(value))\
		
