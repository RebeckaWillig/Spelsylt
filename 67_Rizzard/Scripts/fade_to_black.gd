extends CanvasModulate
signal new_day

func _on_fade_to_black() -> void:
	$AnimationPlayer.play("new_animation")

func _on_discrete_black() -> void:
	$AnimationPlayer.play("new_animation_2")

func _on_animation_finished(_anim_name: StringName) -> void:
	new_day.emit()
