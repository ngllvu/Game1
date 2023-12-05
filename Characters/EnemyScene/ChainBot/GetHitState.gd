extends State

class_name ChainBotGetHit

@export var enemy_health : ChainBotHealth
@export var dead_state : State
@export var dead_animation : String = "dead"
@export var get_hit_animation : String = "get_hit"


func _ready():
	enemy_health.connect("on_hit", on_enemy_health_hit)

func _process(delta):
	pass

func on_enemy_health_hit(node: Node, dmg_amount : int):
	if enemy_health.health > 0:
		emit_signal("interrupt_state", self)
		playback.travel(get_hit_animation)
	else :
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
