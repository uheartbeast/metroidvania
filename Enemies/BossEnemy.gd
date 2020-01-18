extends "res://Enemies/Enemy.gd"

var MainInstances = ResourceLoader.MainInstances
const Bullet = preload("res://Enemies/EnemyBullet.tscn")

export(int) var ACCELERATION = 70

onready var rightWallCheck = $RightWallCheck
onready var leftWallCheck = $LeftWallCheck

signal died

func _ready():
	if SaverAndLoader.custom_data.boss_defeated:
		queue_free()

func _process(delta):
	chase_player(delta)

func chase_player(delta):
	var player = MainInstances.Player
	if player != null:
		var direction_to_move = sign(player.global_position.x - global_position.x)
		motion.x += ACCELERATION * delta * direction_to_move
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		global_position.x += motion.x * delta
		rotation_degrees = lerp(rotation_degrees, (motion.x / MAX_SPEED) * 10, 0.3)
		
		if ((rightWallCheck.is_colliding() and motion.x > 0) or
		(leftWallCheck.is_colliding() and motion.x < 0)):
			motion.x *= -0.5

func fire_bullet() -> void:
	var bullet = Utils.instance_scene_on_main(Bullet, global_position)
	var velocity = Vector2.DOWN * 50
	velocity = velocity.rotated(deg2rad(rand_range(-30, 30)))
	bullet.velocity = velocity

func _on_EnemyStats_enemy_died():
	emit_signal("died")
	SaverAndLoader.custom_data.boss_defeated = true
	._on_EnemyStats_enemy_died()

func _on_Timer_timeout():
	fire_bullet()
