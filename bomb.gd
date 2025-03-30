class_name Bomb extends CharacterBody2D

@onready var anim=get_node("AnimatedSprite2D")
@export var speed: float = 500

func _ready():
	anim.play("default")
func _physics_process(delta):
	velocity.x = speed  
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Goblin:
		anim.play("blast")
		await get_tree().create_timer(0.2).timeout
		self.queue_free()
