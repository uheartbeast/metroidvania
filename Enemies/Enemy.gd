extends KinematicBody2D

# warning-ignore:unused_class_variable
export(int) var MAX_SPEED = 15
# warning-ignore:unused_class_variable
var motion = Vector2.ZERO

onready var stats = $EnemyStats

func _on_Hurtbox_hit(damage):
	stats.health -= damage

func _on_EnemyStats_enemy_died():
	queue_free()
