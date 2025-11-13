extends Node
signal fade_to_black
signal discrete_black

@export var main_menu_scene: PackedScene
var menu_instance: Control

func _ready() -> void:
	Music.play_background()
	#get_node("fairy").end_day.connect(_on_end_day)
	#get_node("house/bed").sleep.connect(_on_end_day_forever)
	#get_node("night").death.connect(_credits)

func _on_start_game_pressed():
	if is_instance_valid(menu_instance):
		menu_instance.queue_free()

func _on_end_day() -> void:
	$Timer.start(9)
	
func _on_end_day_forever():
	fade_to_black.emit()

func _on_timer_timeout() -> void:
	#$fade_to_black.visible = true
	#Should use a discrete value instead and use the fade to black for credits
	discrete_black.emit()
	
func _credits() -> void:
	Music.play_credits()
	get_tree().change_scene_to_file("res://Scenes/end_credit.tscn")

func _on_new_day() -> void:
	# play reverse fade to black
	#$fade_to_black.visible = false
	pass
	
