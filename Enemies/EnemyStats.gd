extends Node

signal enemy_died

export(int) var max_health = 1
onready var health = max_health setget set_health

func set_health(value):
	health = clamp(value, 0, max_health)
	if health == 0:
		emit_signal("enemy_died")

