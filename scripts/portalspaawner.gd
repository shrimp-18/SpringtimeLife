extends Node2D



@onready var game= get_node("/root/game")

var portalscn :=preload("res://scenes/portal.tscn")
var spawnpts:= []

func _ready():
	
	for i in get_children():
		if i is Marker2D:
			spawnpts.append(i)


func _on_timer_timeout():
	var spawn=spawnpts[randi()%spawnpts.size()]
	var portal_spawner=portalscn.instantiate()
	portal_spawner.position=spawn.position
	game.add_child(portal_spawner)
