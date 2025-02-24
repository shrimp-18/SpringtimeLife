extends Node2D


@onready var game= get_node("/root/game")

var coinscn :=preload("res://scenes/coin.tscn")
var spawnpts:= []

func _ready():
	
	for i in get_children():
		if i is Marker2D:
			spawnpts.append(i)


func _on_timer_timeout():
	var spawn=spawnpts[randi()%spawnpts.size()]
	var coin_spawner=coinscn.instantiate()
	coin_spawner.position=spawn.position
	game.add_child(coin_spawner)
