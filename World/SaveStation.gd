extends StaticBody2D

var PlayerStats = ResourceLoader.PlayerStats

onready var animationPlayer = $AnimationPlayer

# warning-ignore:unused_argument
func _on_SaveArea_body_entered(body):
	SoundFX.play("Powerup", 0.6, -10)
	animationPlayer.play("Save")
	SaverAndLoader.save_game()
	PlayerStats.refill_stats()
