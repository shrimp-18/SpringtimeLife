extends Control

@onready var goblin_label =$Label
@onready var lcoin=GameController.level_coins
func _ready():
	EventController.connect("coin_collected", Callable(self, "coin_collected"))
	coin_collected(lcoin)
	print(GameController.level_coins)
func coin_collected(value: int):
	print("Coin collected and UI updated!")
	goblin_label.text = str(value)
