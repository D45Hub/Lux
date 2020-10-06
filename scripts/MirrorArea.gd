extends Area2D

signal score_signal()

var body_exited = false
var direction = "North"

func _on_Area2D_body_entered(body):
	
	if body is Beam:
		if(direction == "East"):
			body.velocity_vector = Vector2(body.velocity, 0)
		elif(direction == "South"):
			body.velocity_vector = Vector2(0, body.velocity)
		elif(direction == "West"):
			body.velocity_vector = Vector2(-body.velocity, 0)
		elif(direction == "North"):
			body.velocity_vector = Vector2(0, -body.velocity)
		
		PlayerVariables.addOneToScore()
		emit_signal("score_signal")
	
	pass

