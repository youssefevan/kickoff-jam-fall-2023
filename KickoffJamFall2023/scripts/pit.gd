extends Entity
class_name Pit

@export var capacity := 1
var current_boulders := 0

func _on_area_entered(area):
	if current_boulders != capacity:
		if area is Pushable:
			if area.type == type:
				current_boulders += 1
				$Sprite.frame = 1
				area.kill()
				
			if current_boulders == capacity:
				$Collider.disabled = true
