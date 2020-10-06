extends Label

func _ready():
	set_text(str(0))
# warning-ignore:return_value_discarded
	PlayerVariables.connect("player_score_signal", self, "_on_PlayerVariables_player_score_signal")
	pass


func _on_PlayerVariables_player_score_signal(player_score):
	set_text(str(player_score))
	pass


func _on_Timer_timeout():
	$FadeInAnimationPlayer.play("fade_in")
	pass
