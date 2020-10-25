extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var grabbed = false
var pos

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self,"body_entered")
	connect("body_exited",self,"body_exited")
	pass # Replace with function body.

func move_to(_pos):
	self.pos = _pos
	
	#Fixme: unnecessary assignments of variables if we already being grabbed
	grabbed = true 
	gravity_scale = 0

func stop_grabbing():
	grabbed = false
	gravity_scale = -1
	
func _integrate_forces(state):
	if (not grabbed):
		return
	var xform = state.get_transform()
	xform.origin.x = pos.x
	xform.origin.y = pos.y
	
	state.set_transform(xform)

func body_entered(node):
	# only do it if colliding with grabbed one
	if (node.grabbed==true):
		gravity_scale = 0
	
func body_exited(node):
	if (node.grabbed==true):
		gravity_scale = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
