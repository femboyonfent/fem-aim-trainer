extends Node3D
@export var mob_scene: PackedScene
@onready var text = $Label3D
@onready var timer2 = $Timer2


#close spawn points 
@onready var right_close = $right_close
@onready var left_close = $left_close
#medium spawn points
@onready var right_med = $right_med
@onready var left_med = $left_med
#far spawn points 
@onready var left_far = $left_far
@onready var right_far = $right_far

#random numbers evens are right odds are left and bigger means further away. 
var spawnpoint = [1,2,3,4,5,6]
var point = spawnpoint.pick_random()


func spawning():
	point = spawnpoint.pick_random()
	var spawn = mob_scene.instantiate()
	if point == 1:
		spawn.position = left_close.position
		print("left_close")
		spawn.pick_dir(1)
	elif point == 2:
		spawn.position = right_close.position
		spawn.pick_dir(2)
		print("right_close")
	elif point == 3:
		spawn.position = left_med.position
		print("left_med")
		spawn.pick_dir(1)
	elif point == 4:
		spawn.position = right_med.position
		print("right_med")
		spawn.pick_dir(2)
	elif point == 5:
		spawn.position = left_far.position
		print("left_far")
		spawn.pick_dir(1)
	elif point == 6: 
		spawn.position = right_far.position
		print("right_far")
		spawn.pick_dir(2)
	get_parent().add_child(spawn)
# note:
# this manages the spawning of the bots. 

func _ready() -> void:
	$Control.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text.text = str(int(timer2.get_time_left()))
	if timer2.is_stopped():
		print($"human bean".score)
		$Control/Label.text ="score: " + str( $"human bean".score) + "accuracy: " + str($"human bean".accuracey * 100 ) + "%"
		$Control.visible = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_timer_timeout() -> void:
	spawning()
