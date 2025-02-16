extends Sprite2D


@onready var parent= $".."

var pressing= false

@export var maxLength=100
@export var deadzone=5

func _ready() -> void:
	pass # Replace with function body.


func _process(_delta):
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position)<= maxLength :
			global_position=get_global_mouse_position()
	else:
		global_position=lerp(global_position,parent.global_position,_delta*30)


func _on_button_button_down() :
	pressing=true


func _on_button_button_up():
	pressing=false
