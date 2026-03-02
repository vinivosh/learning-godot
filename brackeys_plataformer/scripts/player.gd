extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -350.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction. > 1 if to the right, < 1 if to the left, == 0 if not moving at all
	var direction := Input.get_axis("move_left", "move_right")

	# Handle animation and movement
	if direction:
		velocity.x = direction * SPEED
		# Flips player sprite horizontally if going backwards
		animated_sprite.flip_h = direction < 0
		if is_on_floor():
			animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			animated_sprite.play("default")
		else:
			animated_sprite.play("jump")

	move_and_slide()
