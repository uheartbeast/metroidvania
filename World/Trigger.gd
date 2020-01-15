extends Area2D

signal area_triggered

var enabled = true

# warning-ignore:unused_argument
func _on_Trigger_body_entered(body):
	if enabled:
		emit_signal("area_triggered")
		enabled = false
