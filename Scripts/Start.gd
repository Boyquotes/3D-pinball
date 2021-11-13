extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _ready():
	# Non-critical Startup Settings
	OS.set_window_maximized(true)
	get_node("WorldEnvironment").environment.set_dof_blur_far_enabled(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
