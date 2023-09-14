extends Entity
class_name Item

@onready var ray = $PhysicsRay

func push(dir):
	ray.target_position = inputs[dir] * tile_size
	ray.force_raycast_update()
	
	if !ray.is_colliding():
		movement_tween(dir)
