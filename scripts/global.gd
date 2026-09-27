extends Node

var points = 0
const fake_apple = preload("res://scenes/FakeApple.tscn")
const real_apple = preload("res://scenes/RealApple.tscn")
@export var score_counter:Label
@export var time_label:Label
@export var apple_spawn_timer:Timer
@export var game_end_timer:Timer
## amount of apples that will spawn
@export var apples_spawn_per_timer:int = 3
## the higher this value is the less fake apples will spawn
@export var chance_for_fake_apple:int = 3

@export var line:ObjectLinker
var minute = 0
var second = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			var apples = get_tree().get_nodes_in_group("Apple")

			for apple in apples:
				if apple.apple_status == apple.AppleStatus.HOOKED:
					
					if apple.apple_type == apple.AppleType.REAL:
						points += 1
						
					elif apple.apple_type == apple.AppleType.FAKE:
						points += -3

					apple.queue_free()

func _process(_delta: float) -> void:
	for i in get_tree().get_nodes_in_group("Apple"):
		i.get_parent().position.y += randf_range(0.5,2)
	
	if game_end_timer != null:
		minute =  floor(game_end_timer.time_left / 60)
		second =  int(game_end_timer.time_left) % 60
		time_label.text = "time: "+ str(int(minute)) +" : "+ str(second)
	
	if score_counter != null:
		score_counter.text = "score: " +str(points)
	if line != null:
		line.clear_points()
		
	if points >= 40:
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	elif points <= -40:
		get_tree().change_scene_to_file("res://scenes/lose.tscn")
		

func _on_timer_timeout() -> void:
	for i in apples_spawn_per_timer:
		if randi_range(1, chance_for_fake_apple) == chance_for_fake_apple:
			var f_apple = fake_apple.instantiate()
			f_apple.position.y = -250.0
			f_apple.position.x = randi_range(-70, 972)
			add_child(f_apple)
			return
		var r_apple = real_apple.instantiate()
		r_apple.position.y = -250.0
		r_apple.position.x = randi_range(-70, 972)
		add_child(r_apple)
	apple_spawn_timer.start()


func _on_floor_area_entered(area: Area2D) -> void:
	points += -1
	area.get_parent().queue_free()
