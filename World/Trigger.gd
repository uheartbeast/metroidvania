extends Area2D

signal area_triggered

var enabled = true

func _on_Trigger_body_entered(body):
	if enabled:
		emit_signal("area_triggered")
		enabled = false
