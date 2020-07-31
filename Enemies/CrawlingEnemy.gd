extends "res://Enemies/Enemy.gd"

enum DIRECTION {LEFT = -1, RIGHT = 1}

export(DIRECTION) var WALKING_DIRECTION = DIRECTION.RIGHT

onready var floorCast = $FloorCast
onready var wallCast = $WallCast

func _ready():
	wallCast.cast_to.x *= WALKING_DIRECTION

func _physics_process(delta):
	if wallCast.is_colliding():
		global_position = wallCast.get_collision_point()
		var normal = wallCast.get_collision_normal()
		rotation = normal.rotated(deg2rad(90)).angle()
	else:
		floorCast.rotation_degrees = -MAX_SPEED * 10 * WALKING_DIRECTION * delta
		if floorCast.is_colliding():
			global_position = floorCast.get_collision_point()
			var normal = floorCast.get_collision_normal()
			rotation = normal.rotated(deg2rad(90)).angle()
		else:
			rotation_degrees += 20 * WALKING_DIRECTION
		
