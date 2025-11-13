extends CanvasLayer
signal night
signal death

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)

func _fade_to_black() -> void:
	color_rect.visible = true
	animation_player.play("fade_to_black")

func _discrete_black() -> void:
	color_rect.visible = true
	animation_player.play("discrete_black")
#	$LightSwitch.play()

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "fade_to_black":
		death.emit()
		return
	elif anim_name == "discrete_black":
		night.emit()
		animation_player.play("fade_from_black")
		return
	color_rect.visible = false

func _on_timer_timeout() -> void:
	animation_player.play("fade_from_black")
