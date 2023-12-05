extends State

class_name BossAttack

@export var attack_name : String = "attack"
@export var attack_node : String = "attack"
@export var return_state : State
@export var return_animation : String = "move"

@onready var timer : Timer = $Timer

func _ready():
	pass 

func state_input(event : InputEvent):
	if event.is_action_pressed("attack"):
		timer.start()

func state_process(delta):
	pass

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack_name:
		if timer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(attack_node)
