extends Entity
class_name PuzzleTile

func _on_area_entered(area):
	if area is Pushable:
		if area.type == type:
			$Sprite.frame = 1

func _on_area_exited(area):
	$Sprite.frame = 0
