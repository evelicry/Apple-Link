extends Node2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT || event.button_index == MOUSE_BUTTON_MIDDLE || event.button_index == MOUSE_BUTTON_RIGHT:
			get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
