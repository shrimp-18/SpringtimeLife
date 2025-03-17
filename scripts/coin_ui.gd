extends Control

@onready var coin_label =$Label
@onready var lcoin=GameController.level_coins
func _ready():
	EventController.connect("coin_collected", Callable(self, "coin_collected"))
	coin_collected(lcoin)
	print(GameController.level_coins)
func coin_collected(value: int):
	print("Coin collected and UI updated!")
	coin_label.text = str(value)
