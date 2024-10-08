extends CharacterBody3D
class_name Bullet 
const SPEED = 40



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += transform.basis * Vector3(0, 0, -SPEED) * delta
	

func _on_timer_timeout() -> void:
	queue_free()
