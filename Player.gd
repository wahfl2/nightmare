extends CharacterBody2D


const JUMP_VELOCITY = -600.0

const AIR_ACCEL = 10.0
const GROUND_ACCEL = 50.0

const AIR_DAMP = Vector2(0.20, 0.9)
const GROUND_DAMP = Vector2(0.0005, 1.0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func vec2_pow(v: Vector2, exp: float):
	return Vector2(pow(v.x, exp), pow(v.y, exp))

func _physics_process(delta):
	if is_on_floor():
		velocity *= vec2_pow(GROUND_DAMP, delta)
	else:
		velocity.y += gravity * delta
		velocity *= vec2_pow(AIR_DAMP, delta)
		

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var accel = GROUND_ACCEL if is_on_floor() else AIR_ACCEL

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x += direction * accel

	move_and_slide()
