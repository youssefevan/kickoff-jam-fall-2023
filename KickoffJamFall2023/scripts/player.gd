extends CharacterBody2D

const MOVE_SPEED := 10000.0

var push_force = 80.0
var move_input : Vector2

func _physics_process(delta) -> void:
	
	handle_input()
	
	velocity = move_input.normalized() * MOVE_SPEED * delta
	
	# This represents the player's inertia.
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal() * push_force)
	
	move_and_slide()

func handle_input() -> void:
	move_input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
