extends CharacterBody3D
var health = 4 
var SPEED = [6,7,5,8,9]
@onready var speedpick = SPEED.pick_random()
var direction: Vector2
var spawnpoint = [1,2]
@onready var point = spawnpoint.pick_random()
var speed: int
func _ready() -> void:
	point = spawnpoint.pick_random()
	pick_dir(point)
	speedpick = SPEED.pick_random()
	speed = speedpick
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
	

func _physics_process(delta: float) -> void:
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	var input_dir := direction
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	look_at(Vector3(0,1,0))

	move_and_slide()


func _on_timer_timeout() -> void:
	point = spawnpoint.pick_random()
	pick_dir(point)
	speedpick = SPEED.pick_random()
	speed = speedpick


func _on_character_body_3d_tree_exited() -> void:
	queue_free()
