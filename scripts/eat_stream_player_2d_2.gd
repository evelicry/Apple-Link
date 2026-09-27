extends AudioStreamPlayer2D


func _ready() -> void:
	Global.real_apple_eaten.connect(real_apple_eaten)
	Global.fake_apple_eaten.connect(fake_apple_eaten)

func real_apple_eaten() -> void:
	pitch_scale = 1.0
	play()
	
func fake_apple_eaten() -> void:
	pitch_scale = 6.0
	play()
