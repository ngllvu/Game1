extends State

class_name ChainBotAttack

@export var attack_name : String = "attack"
@export var attack_node : String = "attack"
@export var return_animation : String = "idle"
@export var return_state : State

@onready var timer : Timer = $Timer

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_tree_animation_finished(anim_name):
	if anim_name == attack_name:
		if timer.is_stopped():
			next_state = return_state
			playback.travel(return_animation)
		else :
			playback.travel(attack_node)
