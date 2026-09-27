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

var apple_type: AppleType = AppleType.REAL
var apple_status: AppleStatus = AppleStatus.NOT_HOOKED

func _on_timer_timeout() -> void:
	texture = load("res://sprites/apples/red.webp")
	apple_status = AppleStatus.NOT_HOOKED

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			apple_status = AppleStatus.HOOKED
			texture = load("res://sprites/apples/red_bitten.webp")
			$Timer.start()
