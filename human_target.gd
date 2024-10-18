extends CharacterBody3D
var health = 4 
var SPEED = 6
var dir = 0 
var direction: Vector2
func hit():
	print(health)
	health -= 1 
	if health == 0:
		queue_free()
func pick_dir(number):
	if number == 1:
		direction = Vector2.RIGHT
	if number == 2: 
		direction = Vector2.LEFT
	
func _on_character_body_3d_tree_exited() -> void:
	queue_free()


func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	var input_dir := direction
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
