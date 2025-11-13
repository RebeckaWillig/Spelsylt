extends Area2D
var in_fairy = false

func _ready() -> void:
	get_node("../player").interaction.connect(_on_flower_interaction)
	$body.play("day2")
	$dirt.play("dry")

func _on_flower_interaction() -> void:
	if in_fairy:
		print("Player interacts with " + self.name)
		$dirt.play("wet")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Player is in " + self.name)
		in_fairy = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print("Player has left " + self.name)
		in_fairy = false

func _on_behind_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$dirt.z_index = 5
		$body.z_index = 6

func _on_behind_body_exited(body: Node2D) -> void:
	if body.name == "player":
		$dirt.z_index = -1
		$body.z_index = 0
