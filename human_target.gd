extends CharacterBody3D
var health = 4 
var SPEED = 300
func hit():
	print(health)
	health -= 1 
	if health == 0:
		queue_free()

func _on_character_body_3d_tree_exited() -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	var direction = (transform.basis * Vector3(-1, 0, 0))
	if direction:
		velocity.x = direction.x * SPEED
	velocity.x = move_toward(velocity.x, 0, SPEED)
