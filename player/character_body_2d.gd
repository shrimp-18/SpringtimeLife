extends CharacterBody2D
const maxspeed=400
const accln=1500
const friction=600

var input=Vector2.ZERO

func get_input():
	input.x=int(Input.is_action_pressed("vi.right"))-int(Input.is_action_pressed("vi.left"))
	input.y=int(Input.is_action_pressed("vi.down"))-int(Input.is_action_pressed("vi.up"))
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

 
