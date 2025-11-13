extends Area2D
signal fairy_in_bench

func _ready() -> void:
	$Bench.play("blue")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		print("Player is in " + self.name)
		fairy_in_bench.emit(true)

func _on_body_exited(body: Node2D) -> void:
	if body.name == "player":
		print("Player has left " + self.name)
		fairy_in_bench.emit(false)

func _on_behind_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$Bench.z_index = 10

func _on_behind_body_exited(body: Node2D) -> void:
	if body.name == "player":
		$Bench.z_index = 0
