extends Control


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://tracking.tscn")
	print("hello jebus")


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://strafing.tscn")
	print("hello jebus")
