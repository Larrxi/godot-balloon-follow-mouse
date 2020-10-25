extends Control
var grabbed_balloon : Node2D = null
var spawn : PackedScene = load("res://spawn.tscn")

var ammo

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	ammo = 5
	pass # Replace with function body.

func _gui_input(event):
	if event.is_action_pressed("click"):
		Handle_mouse_click(event.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func Handle_mouse_click(pos):

	if grabbed_balloon==null and ammo > 0:
		#make a balloon. Idk maybe make Ballon.tscn and var balloon= Ballon.new()
		#assign that balloon to grabbed_balloon
		grabbed_balloon = spawn.instance()
		grabbed_balloon.position = pos
		#remember add_child(balloon)
		add_child(grabbed_balloon)
		
		
		
		ammo -= 1
	else:
		if grabbed_balloon:
			grabbed_balloon.stop_grabbing()
		grabbed_balloon=null
		
		
func _physics_process(_delta):
	if grabbed_balloon != null:
		grabbed_balloon.move_to(get_viewport().get_mouse_position())
