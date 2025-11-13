extends CharacterBody2D
const DEBUG_MODE = false
const SPEED = 120
var timeout = false
var animation_finished = true
signal interaction

func _ready() -> void:
	$body.play("default")
	for i in get_tree().get_nodes_in_group("interactable"):
		pass

func _process(_delta: float) -> void:
	var interacted = Input.is_action_just_pressed("interact")
	if interacted:
		interaction.emit()

func _physics_process(_delta: float) -> void:
	get_movement()
	move_and_slide()

func get_movement() -> void:
	var direction_x = Input.get_axis("move_left","move_right")
	var direction_y = Input.get_axis("move_up","move_down")
	var local_direction = Vector2(direction_x,direction_y).normalized()
	if direction_x:
		velocity.x = local_direction.x * SPEED
	else:
		velocity.x = move_toward(velocity.x,0,SPEED)
	if direction_y:
		velocity.y = local_direction.y * SPEED
	else:
		velocity.y = move_toward(velocity.y,0,SPEED)

func _on_timer_timeout() -> void:
	timeout = true
