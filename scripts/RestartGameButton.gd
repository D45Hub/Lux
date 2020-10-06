extends TextureButton


func _on_RestartGameButton_pressed():
	PlayerVariables.reset_variables()
	
	$OverlayTransition/TransitionPlayer.play(0.0)
	
	$OverlayTransition/OverlayRect/OverlayRectAnimationPlayer.play("transition")
	yield(get_tree().create_timer(1.0), "timeout")
	
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/MainGame.tscn")
	pass
