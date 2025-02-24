extends Control
@onready var label=$Label

func _ready():
	EventController.connect("health_depleted",on_event_coin_collected)

func on_event_coin_collected(value:int):
	label.text=str(value)
