extends Camera3D
var ray_range = 2000 
@onready var label = $Label
var instance
var score = 0 
var bullet = preload("res://bullet.tscn")
func _input(event: InputEvent):
	if event.is_action_pressed("attack"):
		get_camera_collision()


func get_camera_collision():
	var center = get_viewport().size/2
	
	var Ray_origin = project_ray_origin(center)
	var Ray_End = Ray_origin + project_ray_normal(center) * ray_range
	
	var new_insection = PhysicsRayQueryParameters3D.create(Ray_origin,Ray_End)
	var intersection = get_world_3d().direct_space_state.intersect_ray(new_insection)
	
	if not intersection.is_empty():
		instance = bullet.instantiate()
		instance.position = intersection.collider.position
		get_parent().add_child(instance)
		print(intersection.collider.name)
		score += 10 
		label.text = str(score)
	else:
		print("nothing")
	
	
