extends State

class_name Dash

@export var dash_name : String = "dash"
@export var dash_node : String = "dash"
@export var return_state : State
@export var return_animation : String = "move"
@onready var dtimer : Timer = $dtimer

func state_process(delta):
	pass

func state_input(event : InputEvent):
	if event.is_action_pressed("dash"):
		dtimer.start()

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == dash_name:
		if dtimer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(dash_node)
