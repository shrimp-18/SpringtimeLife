
class_name Goblin extends CharacterBody2D
@onready var anim=get_node("AnimatedSprite2D")

@export var value:int=25

const speed=300
var direction: Vector2

func _ready():
	anim.play("fly")

func _process(delta):
	if true:
		position.x-=speed*delta
		
		




func _on_goblinn_body_entered(body: Node2D) -> void:
	if body is Player:

		
		GameController.health_depleted(value)
		
		await get_tree().create_timer(1).timeout
		
		self.queue_free()
		
		
