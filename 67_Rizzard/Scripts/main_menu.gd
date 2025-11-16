extends Control
signal start
var input_locked = true

func _ready() -> void:
	Gamestate.input_enabled = false
	$VBoxContainer.visible = true
	$VBoxContainer2.visible = true
	$Title.visible = true
	await get_tree().create_timer(0.1).timeout
	input_locked = false

func _on_start_pressed() -> void:
	if input_locked:
		return
	input_locked = true  # prevent any further accidental clicks
	$VBoxContainer.queue_free()
	$VBoxContainer2.queue_free()
	Music.volume_db = -12
	$hej.play()
	await $hej.finished
	$Title.visible = false
	start.emit()

func _on_exit_pressed() -> void:
	get_tree().quit()
