extends Node2D
@onready var tile_map: TileMap = $TileMap
var groundlayer=0

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/home.tscn")

 
func _input(event):
	
	if Input.is_action_pressed("click"):
		print("hello")
		var mouse_pos=get_global_mouse_position()
		var tile_mouse_pos= tile_map.local_to_map(mouse_pos)
		print(tile_mouse_pos)
		var source_id=1
		var atlas_coord :Vector2i  = Vector2i(14,6)
		tile_map.set_cell(groundlayer,tile_mouse_pos,source_id,atlas_coord)
		
		
