class_name Player extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")
@onready var joystick: Node2D = $"../joystick"

@onready var animation_player = $AnimatedSprite2D


var health=100
var health_max=100
var health_min=0
var attack_type :String
var current_attack :bool
var speed=400
const speedd=100


func _ready():
	
	match GameController.selected_player_index:
		0:
			anim.play("pixie")
		1:
			anim.play("pixie2")
		2:
			anim.play("pixie3")
		3:
			anim.play("pixie4")



const maxspeed=10000
const accln=10000
const friction=20

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



	


func _on_player_body_entered(body: Node2D) -> void:
	if body is Goblin:
		anim.play("pixiehurt")
		
		await get_tree().create_timer(2).timeout
		_ready()
		
		
