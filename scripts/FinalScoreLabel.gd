extends Label


func _ready():
	set_text("Score: " + str(PlayerVariables.player_score))
	pass
