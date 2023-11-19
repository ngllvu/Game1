extends State
class_name AS

@export var jump_flip_velocity : float = -250.0
@export var landing_state : State
@export var flip_animation : String = "jump_flip"
@export var landing_animation : String = "landing"

var going_to_flip : bool = false 
var going_to_attack : bool = false
var going_to_dash : bool = false
func state_input(event: InputEvent):
	if event.is_action_pressed("jump") && not going_to_flip :
		jump_flip()
	if event.is_action_pressed("attack") && not going_to_attack :
		air_attack()

func state_process(delta):
	if main.is_on_floor():
		next_state = landing_state

func on_exit():
	if next_state == landing_state:
		playback.travel(landing_animation)
		going_to_flip = false

func jump_flip():
	main.velocity.y = jump_flip_velocity
	playback.travel(flip_animation)
	going_to_flip = true

func air_attack():
	pass
