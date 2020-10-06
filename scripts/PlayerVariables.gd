extends Node

var player_score = 0
signal player_score_signal(player_score)

func _ready():
	pass

func addOneToScore():
	player_score += 1
	emit_signal("player_score_signal", player_score)
	pass

func reset_variables():
	player_score = 0
	pass
