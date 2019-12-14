extends "res://Enemies/Enemy.gd"

export(int) var ACCELERATION = 100

var MainInstances = ResourceLoader.MainInstances

onready var sprite = $Sprite

func _ready():
	set_physics_process(false)

func _physics_process(delta):
	var player = MainInstances.Player
	if player != null:
		chase_player(player, delta)

func chase_player(player, delta):
	var direction = (player.global_position - global_position).normalized()
	motion += direction * ACCELERATION * delta
	motion = motion.clamped(MAX_SPEED)
	sprite.flip_h = global_position < player.global_position
	motion = move_and_slide(motion)

func _on_VisibilityNotifier2D_screen_entered():
	set_physics_process(true)
