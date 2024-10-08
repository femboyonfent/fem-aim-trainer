extends CharacterBody3D
@onready var head = $head
var bullet = preload("res://bullet.tscn")
const mouse_speed = 0.4
const SPEED = 5.0
const JUMP_VELOCITY = 4.5


var instance
@onready var gun_barrel = $head/Camera3D/usps/RayCast3D





func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_use_accumulated_input(false)
func _input(event):
	if event is InputEventMouseMotion:
		
		rotate_y(deg_to_rad(-event.relative.x *  mouse_speed))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_speed))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89),deg_to_rad( 89))
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward ", "backword")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)


	if Input.is_action_just_pressed("attack"):
		instance = bullet.instantiate()
		instance.position = position + Vector3(0,1,0)
		instance.transform.basis = gun_barrel.global_transform.basis
		get_parent().add_child(instance)
	move_and_slide()
