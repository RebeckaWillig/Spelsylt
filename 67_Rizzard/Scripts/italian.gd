extends Area2D
var in_player = false

func _ready() -> void:
	get_node("../player").interaction.connect(_on_interaction)
	$memes.play("default")

func _on_interaction() -> void:
	if in_player:
		print("Player interacts with " + self.name)
		Music.volume_db = -12
		Gamestate.input_enabled = false
		$italian.play()
		$memes.play("skibidi")
		await $memes.animation_finished
		Music.volume_db = 0
		Gamestate.input_enabled = true
		$memes.play("default")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Player is in " + self.name)
		in_player = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print("Player has left " + self.name)
		in_player = false
