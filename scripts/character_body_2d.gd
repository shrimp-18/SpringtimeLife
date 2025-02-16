extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")
@onready var joystick:= $"../joystick"


var speed=150


func _ready():
	anim.play("fairy2")

const maxspeed=10000
const accln=10000
const friction=30

var input=Vector2.ZERO

func _physics_process(delta):
	var direction = joystick.posVector
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2(0,0)
		
	move_and_slide()
	player_movement(delta)

func get_input():
	input.x= int(Input.is_action_pressed("ui_right"))-int(Input.is_action_pressed("ui_left"))
	input.y= int(Input.is_action_pressed("ui_down"))-int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input=get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction*delta):
			velocity -= velocity.normalized() * (friction*delta)
		
		else:
			velocity= Vector2.ZERO
	else:
		velocity+=(input*accln*delta)
		velocity=velocity.limit_length(maxspeed)


 
	move_and_slide()
