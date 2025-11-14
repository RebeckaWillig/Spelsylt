extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	get_tree().paused = false
	animation_player.play("RESET")

func resume() -> void:
	get_tree().paused = false
	animation_player.play_backwards("blur")

func pause() -> void:
	get_tree().paused = true
	animation_player.play("blur")

func testEsc() -> void:
	if get_tree().get_root().find_child("MainMenu", true, false) != null:
		return
	if Input.is_action_just_pressed("escape") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("escape") and get_tree().paused:
		resume()

func _on_resume_pressed() -> void:
	resume()

func _on_main_menu_pressed() -> void:
	resume()
	get_tree().reload_current_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _process(_delta) -> void:
	testEsc()
