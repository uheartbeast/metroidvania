extends "res://Player/Projectile.gd"

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")

const BRICK_LAYER_BIT = 4

func _ready():
	SoundFX.play("Explosion")

func _on_Hitbox_body_entered(body):
	if body.get_collision_layer_bit(BRICK_LAYER_BIT):
		body.queue_free()
		Utils.instance_scene_on_main(EnemyDeathEffect, body.global_position + Vector2(8, 8))
	._on_Hitbox_body_entered(body)
	
