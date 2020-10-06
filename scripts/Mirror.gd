extends Node2D


export var reflection_direction = "Direction"

func _ready():
	$MirrorPath/MirrorPathFollow/MirrorArea.direction = reflection_direction
	pass
