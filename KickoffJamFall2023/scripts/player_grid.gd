extends Entity

@onready var ray = $PhysicsRay

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir) and moving == false:
			move(dir)

func move(dir):
	ray.target_position = inputs[dir] * tile_size
	
	ray.force_raycast_update()
	if !ray.is_colliding():
		movement_tween(dir)
	elif ray.get_collider() is TileMap:
		pass
	elif ray.get_collider() is Entity:
		if ray.get_collider().push(dir) == true:
			movement_tween(dir)

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()

func _on_area_entered(area):
	if area is Pit:
		if area.current_boulders != area.capacity:
			kill()
	elif area is Exit:
		get_tree().change_scene_to_packed(area.next_level)

func kill():
	call_deferred("queue_free")
