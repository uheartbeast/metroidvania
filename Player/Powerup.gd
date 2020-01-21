extends Area2D
class_name Powerup

# warning-ignore:unused_class_variable
var PlayerStats = ResourceLoader.PlayerStats

func _pickup():
	SoundFX.play("Powerup", 1, -15)
