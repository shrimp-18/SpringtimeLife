extends Node2D



@onready var game= get_node("/root/game")

var fruitscn :=preload("res://scenes/collectable_fruit.tscn")
var spawnpts:= []

func _ready():
	
	for i in get_children():
		if i is Marker2D:
			spawnpts.append(i)


func _on_timer_timeout():
	var spawn=spawnpts[randi()%spawnpts.size()]
	var fruit_spawner=fruitscn.instantiate()
	fruit_spawner.position=spawn.position
	game.add_child(fruit_spawner)
