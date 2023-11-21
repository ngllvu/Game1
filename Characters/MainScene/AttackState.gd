extends State
class_name Attack

@export var attack1_name : String = "attack1"
@export var attack2_name : String = "attack2"
@export var attack2_node : String = "attack2"
@export var attack3_name : String = "attack3"
@export var attack3_node : String = "attack3"
@export var attack4_name : String = "air_attack"
@export var attack4_node : String = "air_attack"
@export var return_state : State
@export var return_animation : String = "move"
@onready var atimer : Timer = $atimer

func _ready():
	pass # Replace with function body.

func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		atimer.start()

func state_process(delta):
	pass

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack1_name:
		if atimer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(attack2_node)
		
	if anim_name == attack2_name:
		if atimer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(attack3_node)
		
	if anim_name == attack3_name:
		next_state = return_state
		playback.travel(return_animation)
		
	if anim_name == attack4_name && !main.is_on_floor():
		if atimer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(attack4_node)
