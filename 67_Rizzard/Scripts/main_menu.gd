extends Control
signal start

func _ready() -> void:
	$VBoxContainer.visible = true
	$VBoxContainer2.visible = true

func _on_start_pressed() -> void:
	$VBoxContainer.visible = false
	$VBoxContainer2.visible = false
	Music.volume_db = -12
	$hej.play()
	await $hej.finished
	start.emit()
	queue_free()

func _on_exit_pressed() -> void:
	get_tree().quit()
