extends CharacterBody2D

const MOVE_SPEED := 10000.0

var move_input : Vector2

func _physics_process(delta) -> void:
	
	handle_input()
	
	velocity = move_input.normalized() * MOVE_SPEED * delta
	
	move_and_slide()

func handle_input() -> void:
	move_input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	move_input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
