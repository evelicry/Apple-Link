extends Line2D
class_name ObjectLinker

func _process(_delta: float) -> void:
	for apples in get_tree().get_nodes_in_group("Apple"):
		var apple_position: Vector2 = apples.get_parent().position
		if apples.apple_status == apples.AppleStatus.HOOKED:
			if !points.has(apple_position):
				add_point(apple_position)

func apple_moved() -> void:
	clear_points()
