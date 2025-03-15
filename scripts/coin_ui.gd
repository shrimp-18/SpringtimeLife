extends Control

@onready var coin_label = $CoinLabel

func _ready():
	EventController.connect("coin_collected", on_coin_collected)
	print(coin_label)  # Should not print 'null'


func on_coin_collected(value: int):
	coin_label.text = str(GameController.total_coins)
	
