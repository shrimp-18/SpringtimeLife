extends Control
@onready var label=$Label

func _ready():
	EventController.connect("health_depleted",on_event_coin_collected)

func on_event_coin_collected(value:int):
	label.text=str(value)
	if(value==0):
			get_tree().change_scene_to_file("res://scenes/home.tscn")
