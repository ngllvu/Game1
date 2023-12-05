extends Area2D

@export var main : ChainBot
@export var return_state : State
@export var chase_state : State
@export var chase_animation : String = "run"
@export var return_animation : String = "idle"

var playback : AnimationNodeStateMachinePlayback
var next_state : State

func _ready():
	pass

func _process(delta):
	pass

func _on_body_entered(body):
	for child in body.get_children():
		if child is Main :
			body.chase()


func _on_body_exited(body):
	playback.travel(return_animation)
