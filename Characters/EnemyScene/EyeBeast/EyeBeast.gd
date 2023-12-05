extends CharacterBody2D

class_name EyeBeast

@onready var at : AnimationTree = $AnimationTree

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	at.active = true

func _physics_process(delta):
	pass

	move_and_slide()
