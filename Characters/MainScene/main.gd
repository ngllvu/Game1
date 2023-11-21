extends CharacterBody2D

class_name Main

@export var speed : float = 150.0
@onready var s2d : Sprite2D = $Sprite2D
@onready var at : AnimationTree = $AnimationTree
@onready var sm : MainStateMachine = $MainStateMachine

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facing_direction(facing_right : bool)

func _ready():
	at.active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	direction = Input.get_vector("left", "right", "jump", "dash")
	if direction.x != 0 && sm.check_move():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()

func update_animation():
	at.set("parameters/move/blend_position", direction.x)
	
	#direction_facing
	if direction.x > 0:
		s2d.flip_h = false
	elif direction.x < 0:
		s2d.flip_h = true
	
	emit_signal("facing_direction", !s2d.flip_h)


func _on_heavy_attack_cooldown_timeout():
	pass 

func _on_dash_cooldown_timeout():
	pass
