extends Node

onready var currentLevel = $Level_00

func _ready():
	VisualServer.set_default_clear_color(Color.black)
