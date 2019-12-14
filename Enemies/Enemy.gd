extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

# warning-ignore:unused_class_variable
export(int) var MAX_SPEED = 15
# warning-ignore:unused_class_variable
var motion = Vector2.ZERO

onready var stats = $EnemyStats

func _on_Hurtbox_hit(damage):
	stats.health -= damage

func _on_EnemyStats_enemy_died():
	Utils.instance_scene_on_main(EnemyDeathEffect, global_position)
	queue_free()
