extends Node2D

func _ready() -> void:
	$Text.visible = false
	$Text2.visible = false
	$gyatt.play("default")
	$Rizzard.play("ending")

func _on_animation_finished() -> void:
	$Text.visible = true
	$Timer.start(2)

func _on_timer_timeout() -> void:
	$Text2.visible = true

func _on_button_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/67_Rizzard.tscn")
