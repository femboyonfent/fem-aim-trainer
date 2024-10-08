extends CharacterBody3D
var health = 4
var do_it = 0 


func _on_area_3d_body_entered(body: Node3D) -> void:
	print("guh?")
	health = health - 1

	if health == 0:
		queue_free()





func _on_area_3d_2_body_entered(body: Node3D) -> void:
		queue_free()


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	print("bigrat")
	do_it = do_it +1 
	if do_it == 2:
		queue_free()
	
