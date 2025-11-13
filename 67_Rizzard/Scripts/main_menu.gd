extends Control

func _on_start_pressed() -> void:
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().quit()
