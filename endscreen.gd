extends Control
@onready var label = $Label


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://start_screen.tscn")
