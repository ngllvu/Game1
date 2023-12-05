extends CharacterBody2D

class_name ChainBot

@onready var at : AnimationTree = $AnimationTree
@onready var s2d : Sprite2D = $Sprite2D
@onready var playback : AnimationNodeStateMachinePlayback
@export var chase_state : State
@export var chase_animation : String = "run"

var next_state : State
const speed = 100.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var target = $"../../Main"

func _ready():
	at.active = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if target == null :
		target.get_tree().get_nodes_in_group("Player")
		look_at(target.global_position)
	else :
		velocity = position.direction_to(target.position) * speed
		next_state = chase_state
	
	move_and_slide()

func change_state():
	velocity.x *= -1
	scale.x *= -1
