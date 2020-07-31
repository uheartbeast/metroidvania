extends Node2D

# warning-ignore:unused_argument
func _process(delta):
	var player = get_parent()
	rotation = player.get_local_mouse_position().angle()
