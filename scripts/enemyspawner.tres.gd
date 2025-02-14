extends Node2D

@onready var game= get_node("/root/game")

var goblinscn :=preload("res://scenes/goblin.tscn")
var spawnpts:= []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawnpts.append(i)


func _on_timer_timeout():
	var spawn=spawnpts[randi()%spawnpts.size()]
	var goblin=goblinscn.instantiate()
	goblin.position=spawn.position
	game.add_child(goblin)
