extends Control

@onready var fruit_label = $Label

func _ready():
	EventController.connect("fruit_collected", on_fruit_collected)

func on_fruit_collected(value: int):
	fruit_label.text = str(value)
