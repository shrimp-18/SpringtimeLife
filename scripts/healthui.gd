extends Control
@onready var label=$Label
@onready var anim=get_node("healthanim")
func _ready():
	EventController.connect("health_depleted",on_event_coin_collected)
	anim.play("health")

func on_event_coin_collected(value:int):
	label.text=str(value)
	if(value==100):
		anim.play("health")
	if(value==75):
		anim.play("health1")
	if(value==50):
		anim.play("health2")
	if(value==25):
		anim.play("health3")
	if(value==0):
		anim.play("health4")
		get_tree().change_scene_to_file("res://scenes/home.tscn")
