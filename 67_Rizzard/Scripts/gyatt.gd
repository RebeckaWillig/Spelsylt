extends Area2D
var in_player = false
signal ending

func _ready() -> void:
	get_node("../player").interaction.connect(_on_interaction)
	$gyatt.play("default")

func _on_interaction() -> void:
	if in_player:
		print("Player interacts with " + self.name)
		Gamestate.input_enabled = false
		$gyatt.play("wiggle")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Player is in " + self.name)
		in_player = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print("Player has left " + self.name)
		in_player = false

func _on_animation_finished() -> void:
	ending.emit()
	#Gamestate.input_enabled = true
	#$gyatt.play("default")
	pass
