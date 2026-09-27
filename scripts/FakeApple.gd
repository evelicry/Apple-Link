extends Sprite2D

## this is so the line works!!
## also so autocomplete works

enum AppleType {
	REAL,
	FAKE
}

enum AppleStatus {
	HOOKED,
	NOT_HOOKED
}

var apple_type: AppleType = AppleType.FAKE
var apple_status: AppleStatus = AppleStatus.NOT_HOOKED

func _on_timer_timeout() -> void:
	apple_status = AppleStatus.NOT_HOOKED

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			apple_status = AppleStatus.HOOKED
			$Timer.start()
