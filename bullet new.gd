extends CharacterBody3D
class_name Bullet

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_as_top_level(true)


func _on_timer_timeout() -> void:
	queue_free()
