extends AudioStreamPlayer2D

func _ready():
# warning-ignore:return_value_discarded
	PlayerVariables.connect("player_score_signal", self, "_on_PlayerVariables_player_score_signal")
	pass

func _on_PlayerVariables_player_score_signal(_player_score):
	play(0.0)
	pass
