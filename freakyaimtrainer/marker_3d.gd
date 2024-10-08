extends Marker3D
@onready var bullet_scene = preload("res://bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent):
	if Input.is_action_just_pressed("attack"):
		shoot()



func shoot():
	var b = bullet_scene.instantiate() 
	get_tree().root.add_child(b)
	b.rotation_degrees = $".".global_transform.basis.get_euler()
	$".".add_child(b)
	#bullet.rotation = move_direction.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
