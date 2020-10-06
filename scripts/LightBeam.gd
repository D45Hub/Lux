extends KinematicBody2D
class_name Beam

const velocity = 200.0
var velocity_vector = Vector2(0, -velocity)

var has_scored = false
var start_velocity

func _ready():
# warning-ignore:return_value_discarded
	PlayerVariables.connect("player_score_signal", self, "_on_PlayerVariables_player_score_signal")
	start_velocity = generateRandomStartVelocity()
	pass

func _process(_delta):
# warning-ignore:return_value_discarded
	if has_scored:
		var beam_velocity = Vector2(velocity_vector.x * (1 + PlayerVariables.player_score / 10.0), velocity_vector.y * (1 + PlayerVariables.player_score / 10.0))
		move_and_slide(beam_velocity)
	else:
# warning-ignore:return_value_discarded
		move_and_slide(start_velocity)
	
	pass

func _on_VisibilityNotifier2D_screen_exited():
	
	$GameOverSoundPlayer.play(0.0)
	yield(get_tree().create_timer(1.0), "timeout")
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/GameOver.tscn")
	
	pass


func _on_PlayerVariables_player_score_signal(_player_score):
	has_scored = true
	pass


func generateRandomStartVelocity():
	
	var random_start_velocity = Vector2(0, 0)
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	
	var positive_or_negative_x = rng.randi_range(-1, 1)
	while(positive_or_negative_x == 0):
		rng.randomize()
		positive_or_negative_x = rng.randi_range(-1, 1)
	
	var positive_or_negative_y = rng.randi_range(-1, 1)
	while(positive_or_negative_y == 0):
		rng.randomize()
		positive_or_negative_y = rng.randi_range(-1, 1)
	
	random_start_velocity = Vector2(180*positive_or_negative_x, 100*positive_or_negative_y)
	$Sprite.rotation_degrees = positive_or_negative_x*45
	
	if positive_or_negative_y > 0:
		$Sprite.rotation_degrees = 180 - (positive_or_negative_x*45)
	
	return random_start_velocity
