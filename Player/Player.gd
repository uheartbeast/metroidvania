extends KinematicBody2D

export (int) var ACCELERATION = 512
export (int) var MAX_SPEED = 64
export (float) var FRICTION = 0.25

var motion = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	if input_vector != Vector2.ZERO:
		motion += input_vector * ACCELERATION * delta
		motion = motion.clamped(MAX_SPEED)
	else:
		motion = motion.linear_interpolate(Vector2.ZERO, FRICTION)
	
	
	motion = move_and_slide(motion)