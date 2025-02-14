extends Node2D

@onready var game= get_node("/root/game")

var goblinscn :=preload("res://scenes/goblin.tscn")
var spawnpts:= []

func _ready():
	for i in get_children():
		if i is Marker2D:
			spawnpts.append(i)
