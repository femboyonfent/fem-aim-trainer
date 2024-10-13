extends CharacterBody3D
@onready var head = $head
@onready var aim_ray = $head/Camera3D/RayCast3D
@onready var label = $head/Camera3D/Label
@onready var score = 0 
var bullet = preload("res://bullet.tscn")
const mouse_speed = 0.4
const SPEED = 5.0
const JUMP_VELOCITY = 4.5





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
	if Input.is_action_just_pressed("attack"):
		_shoot_USPS()

	if not is_on_floor():
		velocity += get_gravity() * delta

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

	move_and_slide()

func _shoot_USPS():
	if not $head/Camera3D/usps/AnimationPlayer.is_playing():
		$head/Camera3D/usps/AnimationPlayer.play("shoot")
		$head/Camera3D/usps/AudioStreamPlayer3D.play()
		if aim_ray.is_colliding():
			if aim_ray.get_collider().is_in_group("target"):
				aim_ray.get_collider().hit()
				score += 10
				label.text = str(score)
				print("bazinga!!!")
			elif  aim_ray.get_collider().is_in_group("head"):
				aim_ray.get_collider().headshot()
				score += 30
				label.text = str(score)
