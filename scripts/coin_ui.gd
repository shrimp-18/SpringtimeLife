extends Control

@onready var coin_label =$Label

func _ready():
	
	EventController.coin_collected.connect("on_coin_collected")

func on_coin_collected(value: int):
	print("Coin collected and UI updated!")
	coin_label.text = str(value)
