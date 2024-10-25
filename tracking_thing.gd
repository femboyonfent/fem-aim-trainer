extends CharacterBody3D
@onready var head = $head
@onready var aim_ray = $head/Camera3D/RayCast3D
@onready var score_ = $head/Camera3D/score
@onready var timer = $head/Camera3D/timer
@onready var score = 1
@onready var accuracey =  1
var attempts: float
var hits: float
const mouse_speed = 0.1
const SPEED = 5.0





func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_use_accumulated_input(false)
func _input(event):
	if event is InputEventMouseMotion:
		
		rotate_y(deg_to_rad(-event.relative.x *  mouse_speed))
		head.rotate_x(deg_to_rad(-event.relative.y * mouse_speed))
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-89),deg_to_rad( 89))
func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("attack"):
		accuracey = hits / attempts
		attempts = attempts + 1 
		_shoot_USPS()
		score_.text = str(score)

	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()

func _shoot_USPS():
	if aim_ray.is_colliding():
		if aim_ray.get_collider().is_in_group("target"):
			hits = hits + 1
			score += 10
		elif  aim_ray.get_collider().is_in_group("head"):
				hits = hits + 1 
				score += 30
