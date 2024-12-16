extends Control

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player := $AnimationPlayer

func _ready() -> void:
	pass
	#animation_player.play("new_animation")

func _on_button_pressed() -> void:
	animation_player.play_backwards("new_animation")
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://game.tscn")
