extends Node2D

var save_path = "res://variable.save"


var1=total_coins

func _on_quit_pressed():
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")

func save():
	var file= FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(total_coins)
	file.store_var(total_fruits)
	
func load_date():
	if FileAccess.file_exists(save_path):
		var file=FileAccess.open(save_path,FileAccess.READ)
		total_coins=file.get_var(total_coins)
		total_fruits=file.get_var(total_fruits)
	else:
		print("no data saved...")
		total_coins=0
		total_fruits=0
		


func _on_texture_button_2_pressed() -> void:
	save()
