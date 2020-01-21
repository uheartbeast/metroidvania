extends Control

func _ready():
	VisualServer.set_default_clear_color(Color.black)

func _on_StartButton_pressed():
	SoundFX.play("Click", 1, -10)
	get_tree().change_scene("res://World.tscn")

func _on_LoadButton_pressed():
	SoundFX.play("Click", 1, -10)
	SaverAndLoader.is_loading = true
	get_tree().change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
