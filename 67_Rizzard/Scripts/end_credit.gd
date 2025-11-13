extends Control

@export var scroll_speed: float = 26.0
@export var speed_up_multiplier: float = 5.0

@export var font_color: Color = Color.WHITE
@export var font_size: int = 8
@export var line_spacing: int = 15
@export var custom_font: Font = load("res://Assets/MainMenu/FontStyle/PixelOperator8-Bold.ttf")
@export var custom_font2: Font = load("res://Assets/MainMenu/FontStyle/PixelOperator8.ttf")

@export var credits_data: Array[String] = [
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	" ",
	"Gilded Cage!",
	" ",
	" ",
	" ",
	"Creative Director@",
	"Ida Altenstedt",
	" ",
	"Git Manager@",
	"Egil Guting",
	" ",
	"Programmers@",
	"Egil Guting",
	"Taiming Huang",
	"Rebecka Willig",
	" ",
	"Artists@",
	"Tarek Alfutih",
	"Ida Altenstedt",
	"Adam Wikström",
	" ",
	"Main Character Designer@",
	"Adam Wikström",
	" ",
	"Sound Designers@",
	"Tarek Alfutih",
	"Rebecka Willig",
	" ",
	"Composer@",
	"Rebecka Willig",
	" ",
	"Narrative Creators@",
	"Tarek Alfutih",
	"Ida Altenstedt",
	"Egil Guting",
	"Taiming Huang",
	"Adam Wikström",
	"Rebecka Willig",
	" ",
]

@onready var credits_container: VBoxContainer = $ColorRect/CreditsContainer
var is_speeding_up: bool = false

func _ready() -> void:
	credits_container.position.y = get_viewport_rect().size.y
	_generate_credits()

func _process(delta: float) -> void:
	var current_speed = scroll_speed
	if is_speeding_up:
		current_speed *= speed_up_multiplier
	
	credits_container.position.y -= current_speed * delta
	
	if credits_container.position.y + credits_container.size.y < 0:
		_return_to_main_menu()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		_return_to_main_menu()
		
	if event.is_action_pressed("ui_accept") or event.is_action_pressed("ui_down"):
		is_speeding_up = true
	
	if event.is_action_released("ui_accept") or event.is_action_released("ui_down"):
		is_speeding_up = false

func _generate_credits() -> void:
	credits_container.add_theme_constant_override("separation", line_spacing)
	
	for line_text in credits_data:
		if line_text.is_empty():
			var spacer = Control.new()
			spacer.custom_minimum_size.y = font_size
			credits_container.add_child(spacer)
			continue
		
		var label = Label.new()
		print(line_text.left(line_text.length() - 1))
		if line_text[-1] == '!':
			label.text = line_text.left(line_text.length() - 1)
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			
			label.add_theme_color_override("font_color", font_color)
			label.add_theme_font_size_override("font_size", font_size+8)
			label.add_theme_font_override("font", custom_font)
		elif line_text[-1] == '@':
			label.text = line_text.left(line_text.length() - 1)
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			
			label.add_theme_color_override("font_color", font_color)
			label.add_theme_font_size_override("font_size", font_size)
			label.add_theme_font_override("font", custom_font)
		else:
			label.text = line_text
			label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
			
			label.add_theme_color_override("font_color", font_color)
			label.add_theme_font_size_override("font_size", font_size)
			label.add_theme_font_override("font", custom_font2)
			
		credits_container.add_child(label)

func _return_to_main_menu() -> void:
	set_process(false)
	get_tree().change_scene_to_file("res://Scenes/gilded_cage.tscn")
