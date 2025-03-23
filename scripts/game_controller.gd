extends Node

var total_coins: int = 0
var total_fruits: int = 0
var total_health: int = 100
var selected_player_index: int = 0
var selected_player_index1: int = 0
var selected_background_index:int =0
var level_coins: int = 0  

const save_path = "user://savegame.dat"

func _ready():
	load_selected_background()
	load_data()
	load_selected_player()
	reset_level_coins() 

func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(total_coins)
	file.store_var(total_fruits)
	file.store_var(total_health)
	file.close()
	
func load_selected_background():
	if FileAccess.file_exists("user://selected_background.save"):
		var file=FileAccess.open("user://selected_background.save",FileAccess.READ)
		selected_background_index=file.get_var()
		file.close()

func load_selected_player():
	if FileAccess.file_exists("user://selected_player.save"):
		var file = FileAccess.open("user://selected_player.save", FileAccess.READ)
		selected_player_index = file.get_var()
		selected_player_index1 = file.get_var()
		file.close()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		total_coins = file.get_var()
		total_fruits = file.get_var()
		file.close()
		EventController.emit_signal("coin_collected", total_coins)
		EventController.emit_signal("fruit_collected", total_fruits)



func reset_level_coins():
	level_coins = 0
	EventController.emit_signal("coin_collected", level_coins)


func coin_collected(value: int):
	total_coins += value
	level_coins += value
	print("Total:", total_coins, "Level:", level_coins)
	EventController.emit_signal("coin_collected", level_coins)
	save_data()

func fruit_collected(value: int):
	total_fruits += value
	print(total_fruits)
	EventController.emit_signal("fruit_collected", total_fruits)
	save_data()

func health_depleted(value: int):
	total_health -= value
	EventController.emit_signal("health_depleted", total_health)
	save_data()

func load_coins():
	if FileAccess.file_exists("user://coins.save"):
		var file = FileAccess.open("user://coins.save", FileAccess.READ)
		total_coins = file.get_var()
		file.close()
