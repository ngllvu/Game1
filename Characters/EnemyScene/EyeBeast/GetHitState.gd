extends State

class_name GetHit

@export var dmgable : DmgAble
@export var dead_state : State
@export var dead_animation : String = "dead"
@export var gethit_animation : String = "get_hit"

func _ready():
	dmgable.connect("on_hit", on_dmgable_hit)

func _process(delta):
	pass

func on_dmgable_hit(node: Node, dmg_amount : int):
	if dmgable.health > 0:
		emit_signal("interrupt_state", self)
		playback.travel(gethit_animation)
	else :
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)

