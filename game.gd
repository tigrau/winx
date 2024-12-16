extends Control

@onready var v_box_container: VBoxContainer = %VBoxContainer
@export var part_node : PackedScene
var current_note : NovelNote

func _ready() -> void:
	current_note = load("res://resources/note_1.tres")
	set_note()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		var part = part_node.instantiate() as GPUParticles2D
		part.position = get_global_mouse_position()
		part.emitting = true
		get_tree().current_scene.add_child(part)


func set_note():
	for child in v_box_container.get_children():
		child.queue_free()
	
	var label = Label.new()
	label.text = current_note.text
	label.autowrap_mode = 2
	label.custom_minimum_size = Vector2(300,40)
	v_box_container.add_child(label)
	
	if current_note.options.size() > 0:
		var button_yes = Button.new()
		button_yes.text = current_note.options[0].text
		v_box_container.add_child(button_yes)
		button_yes.pressed.connect(_go_somewere.bind(current_note.options[0].destionation))
		
		var button_no = Button.new()
		button_no.text = current_note.options[1].text
		button_no.pressed.connect(_go_somewere.bind(current_note.options[1].destionation))
		v_box_container.add_child(button_no)


func _go_somewere(where):
	current_note = where
	set_note()
