extends CharacterBody2D
const SPEED = 120
const START_POSITION = Vector2(280, 780)
var animation_finished = true
signal interaction

const DEBUG_MODE = false
const DEBUG_START_POSITION = Vector2(1760, 780)

func _ready() -> void:
	if DEBUG_MODE:
		position = DEBUG_START_POSITION
	else:
		position = START_POSITION
	$body.play("default")

func _process(_delta: float) -> void:
	if not Gamestate.input_enabled:
		return
	var interacted = Input.is_action_just_pressed("interact")
	if interacted:
		interaction.emit()

func _physics_process(_delta: float) -> void:
	if not Gamestate.input_enabled:
		return
	get_movement()
	move_and_slide()

func get_movement() -> void:
	if not Gamestate.input_enabled:
		return
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
