extends Entity
class_name Pit

@export var capacity := 1
var current_boulders := 0

func _on_area_entered(area):
	if area is Pushable:
		if area.type == type and area.moving == false:
			current_boulders += 1
			$Sprite.frame = 1
			area.kill()
