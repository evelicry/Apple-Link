extends Sprite2D

## this is so the line works!!
## also so autocomplete works
class_name  Apple

signal apple_has_moved()
var points = 0 # This is temporary. I have to figure out how to make a global point system and spawner.

enum AppleType {
	REAL,
	FAKE
}

enum AppleStatus {
	HOOKED,
	NOT_HOOKED
}

var apple_type: AppleType = AppleType.REAL
var apple_status: AppleStatus = AppleStatus.NOT_HOOKED

func _on_timer_timeout() -> void:
	apple_status = AppleStatus.NOT_HOOKED

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			apple_status = AppleStatus.HOOKED
			$Timer.start()
			
		if event.button_index == MOUSE_BUTTON_RIGHT:
			var apples = get_tree().get_nodes_in_group("Apple")			
			for apple in apples:
				if apple.apple_status == AppleStatus.HOOKED:
					
					if apple.apple_type == AppleType.REAL:
						points += 1
						
					elif apple.apple_type == AppleType.FAKE:
						points -= 1
						
					apple.queue_free()
					print(points)

func _enter_tree() -> void:
	set_notify_transform(true)
# i just learned of this so it should work
func _notification(what: int) -> void:
	if what == NOTIFICATION_TRANSFORM_CHANGED:
		apple_has_moved.emit()
