extends StaticBody2D

onready var animationPlayer = $AnimationPlayer

func _on_SaveArea_body_entered(body):
	animationPlayer.play("Save")
	SaverAndLoader.save_game()
