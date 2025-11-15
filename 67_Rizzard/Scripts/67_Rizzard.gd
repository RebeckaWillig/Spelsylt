extends Node
signal discrete_black

@export var main_menu_scene: PackedScene
var menu_instance: Control

func _ready() -> void:
	Music.play_background()

func _on_start_game_pressed():
	if is_instance_valid(menu_instance):
		menu_instance.queue_free()

func _on_timer_timeout() -> void:
	discrete_black.emit()

func _on_ending() -> void:
	get_tree().change_scene_to_file("res://Scenes/ending.tscn")

func _on_start() -> void:
	$piltangenterna.play()
	await $piltangenterna.finished
	Music.volume_db = 0
	Gamestate.input_enabled = true
