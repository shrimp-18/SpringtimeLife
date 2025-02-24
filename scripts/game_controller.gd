extends Node
var total_coins:int = 0
var total_fruits:int = 0
var total_health:int=100

func coin_collected(value:int):
	total_coins += value
	EventController.emit_signal("coin_collected", total_coins)
	
func fruit_collected(value:int):
	total_fruits += value
	print(total_fruits)
	EventController.emit_signal("fruit_collected", total_fruits)

func health_depleted(value:int):
	total_health =total_health-value
	EventController.emit_signal("health_depleted",total_health)
