extends Sprite


var first_reflect = false

func _ready():
# warning-ignore:return_value_discarded
	PlayerVariables.connect("player_score_signal", self, "_on_PlayerVariables_player_score_signal")
	pass

func _on_PlayerVariables_player_score_signal(_player_score):
	
	if not first_reflect:
		rotation_degrees += 45
		first_reflect = true
	
	rotation_degrees += 90
	pass
