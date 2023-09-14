extends Entity

@onready var ray = $PhysicsRay
var extend_ray = false

var current_item : Item

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir) and moving == false:
			move(dir)

func move(dir):
	if extend_ray == true:
		ray.target_position = inputs[dir] * tile_size * 2
	else:
		ray.target_position = inputs[dir] * tile_size
	
	ray.force_raycast_update()
	if !ray.is_colliding():
		movement_tween(dir)
		extend_ray = false
	elif ray.get_collider() is TileMap:
		extend_ray = false
	elif ray.get_collider().get_collision_layer_value(3):
		extend_ray == true
		push(ray.get_collider())

func push(collider : Entity):
	print('push')
