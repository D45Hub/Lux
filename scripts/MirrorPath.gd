extends Path2D

onready var follow = get_node("MirrorPathFollow")

const maximum_press_time = 1.5

var mouse_inside = true
var rng = RandomNumberGenerator.new()

var time_elapsed_pressing = 0

var movement = 0

func _ready():
	rng.randomize()
	movement = rng.randf_range(-2.0, 2.0)
	pass


func _process(delta):
	
	if(Input.is_action_pressed("ui_up") and time_elapsed_pressing < maximum_press_time):
		follow.set_offset(follow.get_offset() - rng.randi_range(1, 5))
		time_elapsed_pressing += delta
	elif(Input.is_action_pressed("ui_down") and time_elapsed_pressing < maximum_press_time):
		follow.set_offset(follow.get_offset() + rng.randi_range(1, 5))
		time_elapsed_pressing += delta
	else:
		Input.action_release("ui_down")
		Input.action_release("ui_up")
		follow.set_offset(follow.get_offset() + movement)
		time_elapsed_pressing = 0
	
	pass


func _on_Area2D_score_signal():
	rng.randomize()
	movement = rng.randf_range(-2.0, 2.0)
	pass

