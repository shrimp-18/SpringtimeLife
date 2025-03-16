extends Control

@onready var coin_label =$Label

func _ready():
	EventController.connect("coin_collected", Callable(self, "on_coin_collected"))
	EventController.connect("coin_collected", Callable(self, "on_coin_collected"))

func on_coin_collected(value: int):
	print("Coin collected and UI updated!")
	coin_label.text = str(value)
