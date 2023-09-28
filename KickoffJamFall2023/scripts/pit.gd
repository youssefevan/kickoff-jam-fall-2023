extends Entity
class_name Pit

@export var capacity := 1
var current_boulders := 0

func _ready():
	update_sprite()

func _on_area_entered(area):
	if current_boulders != capacity:
		if area is Pushable:
			if area.type == type:
				current_boulders += 1
				
				update_sprite()
				area.kill()
				
			if current_boulders == capacity:
				$Collider.disabled = true

func update_sprite():
	if current_boulders == 0:
		if capacity == 1:
			$Sprite.frame = 0
		elif capacity == 2:
			$Sprite.frame = 2
		else:
			$Sprite.frame = 4
	elif current_boulders == 1:
		if capacity == 1:
			$Sprite.frame = 1
		elif capacity == 2:
			$Sprite.frame = 3
		else:
			$Sprite.frame = 5
	elif current_boulders == 2:
		if capacity == 2:
			$Sprite.frame = 1
		elif capacity == 3:
			$Sprite.frame = 3
	elif current_boulders == 3:
		if capacity == 3:
			$Sprite.frame = 1
