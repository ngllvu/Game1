extends State

class_name GS

@export var jump_velocity : float = -250.0
@export var air_state : State
@export var land_state : State
@export var jump_animation : String = "jump"
@export var attack_node : String = "attack1"
@export var attack_state : State
@export var dash_animation : String = "dash"
@export var dash_state : State

@onready var gtimer : Timer = $gtimer

func _ready():
	pass # Replace with function body.

func state_input(event : InputEvent):
	if event.is_action_pressed("jump"):
		jump()
	if event.is_action_pressed("attack"):
		attack()
	if event.is_action_pressed("dash"):
		dash()

func state_process(delta):
	if not main.is_on_floor() && gtimer.is_stopped():
		next_state = air_state

func jump():
	main.velocity.y = jump_velocity
	next_state = air_state
	playback.travel(jump_animation)

func attack():
	next_state = attack_state
	playback.travel(attack_node)

func dash():
	
	next_state = dash_state
	playback.travel(dash_animation)
