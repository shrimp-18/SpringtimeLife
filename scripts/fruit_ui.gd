extends Control
@onready var label=$Label

func _ready():
	EventController.connect("fruit_collected",on_event_coin_collected)

func on_event_coin_collected(value:int):
	label.text=str(value)
