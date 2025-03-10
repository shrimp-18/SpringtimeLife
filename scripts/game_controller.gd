extends Node

var total_coins: int = 0
var total_fruits: int = 0
var total_health: int = 100

const  save_path = "user://savegame.dat"


func _ready():
	load_data()

# Save function
func save_data():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(total_coins)
	file.store_var(total_fruits)
	file.store_var(total_health)
	file.close()

# Load function
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		total_coins = file.get_var()
		total_fruits = file.get_var()
		
		file.close()
		print("Data loaded successfully!")
		print("Coins:", total_coins)
		print("Fruits:", total_fruits)
		print("Health:", total_health)
		EventController.emit_signal("coin_collected", total_coins)
		EventController.emit_signal("fruit_collected", total_fruits)
	else:
		print("No save file found, starting fresh.")

# Coin collection
func coin_collected(value: int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
	save_data()

# Fruit collection
func fruit_collected(value: int):
	total_fruits += value
	print(total_fruits)
	EventController.emit_signal("fruit_collected", total_fruits)
	save_data()

# Health reduction
func health_depleted(value: int):
	total_health -= value
	EventController.emit_signal("health_depleted", total_health)
	save_data()
