extends Node

class_name  EyeBeastHealth

@export var health : float = 500.0
@export var dead_name : String = "dead"

signal on_hit(node : Node, dmg_taken : int)

func _ready():
	pass 

func _process(delta):
	pass

func hit(damage : int):
	health -= damage
	emit_signal("on_hit", get_parent(), damage)

func _on_animation_tree_animation_finished(anim_name):
	if anim_name == dead_name && health <= 0:
		get_parent().queue_free()
