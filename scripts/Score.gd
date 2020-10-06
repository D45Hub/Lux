extends Node2D


func _ready():
	position.x -= (str(PlayerVariables.player_score).length() - 1) * 20
	pass
