extends State

@export var main_health : MainHealth
@export var dead_state : State
@export var dead_animation : String = 'dead'
@export var get_hit_animation : String = "hurt"

func _ready():
	main_health.connect("on_hit", _on_main_health_hit)

func _process(delta):
	pass

func _on_main_health_hit(node : Node, dmg_amount : int):
	if main_health.health > 0:
		emit_signal("interrupt_state", self)
		playback.travel(get_hit_animation)
	else :
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
	
