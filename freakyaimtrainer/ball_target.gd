extends CharacterBody3D

func _on_area_3d_body_entered(body: Node3D) -> void:
	print("guh?")


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("Bullet"):
		print("guh?")
		queue_free()


func _on_area_3d_2_body_entered(body: Node3D) -> void:
		queue_free()
