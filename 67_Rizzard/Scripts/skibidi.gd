extends Area2D
var in_player = false

func _ready() -> void:
	get_node("../player").interaction.connect(_on_interaction)
	$toilet.play("default")

func _on_interaction() -> void:
	if in_player:
		print("Player interacts with " + self.name)
		Gamestate.input_enabled = false
		$toilet.play("skibidi")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Player is in " + self.name)
		in_player = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print("Player has left " + self.name)
		in_player = false

func _on_toilet_animation_finished() -> void:
	Gamestate.input_enabled = true
	$toilet.play("default")
