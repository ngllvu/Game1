extends State

class_name CS

@export var chase_animation : String = "run"
@export var return_animation : String = "idle"
@export var return_state : State
func _ready():
	pass 

func _process(delta):
	pass

func chase():
	playback.travel(chase_animation)

func _on_animation_tree_animation_finished(anim_name):
	pass
