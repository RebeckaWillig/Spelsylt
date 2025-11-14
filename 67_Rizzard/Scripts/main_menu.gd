extends Control

func _ready() -> void:
	$Panel/Rizzard.play("default")

func _on_start_pressed() -> void:
	Gamestate.input_enabled = true
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().quit()
