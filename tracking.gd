extends Node3D
@onready var timer2 = $CharacterBody3D/Timer
@onready var text = $CharacterBody3D/head/Camera3D/timer 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Control.visible = false


func _process(delta: float) -> void:
	text.text = str(int(timer2.get_time_left()))
	if timer2.is_stopped():
		$Control/Label.text ="score: " + str( $CharacterBody3D.score) + " "+ "accuracy: " + str(int($CharacterBody3D.accuracey * 100)) + "%"
		$Control.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
