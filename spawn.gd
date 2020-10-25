extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func move_to(pos):
	$RigidBody2D.move_to(pos)
func stop_grabbing():
	$RigidBody2D.stop_grabbing()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
