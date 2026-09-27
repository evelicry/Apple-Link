extends Line2D
## link's Objects together ([b]and only [code]Apple[/code] in the parent of line[/b]) 
## this is poor and quite bad.
class_name  ObjectLinker


func _process(_delta: float) -> void:
	for i in get_tree().get_nodes_in_group("Apple"):
		var apple_position:Vector2 = i.get_parent().position
		if i is Apple:
			i.apple_has_moved.connect(apple_moved)
			if i.apple_type == Apple.AppleStatus.HOOKED:
				if points.has(apple_position) == false:
					print("apple at {0} is now hooked!!", apple_position)
					add_point(apple_position)
	
	
		
func apple_moved() -> void:
	clear_points()
