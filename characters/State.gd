extends Node

class_name State

@export var can_move : bool = true

var playback : AnimationNodeStateMachinePlayback
var main : CharacterBody2D
var next_state : State

func state_input(event : InputEvent):
	pass

func on_enter():
	pass
	
func on_exit():
	pass

func state_process(delta):
	pass
