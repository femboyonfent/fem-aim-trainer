extends Node3D
@export var mob_scene = preload("res://human_target.tscn")



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
	var spawn = mob_scene.instantiate()
	if point == 1:
		spawn.instant(left_close.position)
	elif point == 2:
		spawn.initialize(right_close.position)
	elif point == 3:
		spawn.initialize(left_med.position)
	elif point == 4:
		spawn.initialize(right_med.position)
	elif point == 5:
		spawn.initialize(left_far.position)
	elif point == 6: 
		spawn.initialize(right_far.position)
		

# note:
# this manages the spawning of the bots. 



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	pass
