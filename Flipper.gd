extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func _physics_process(_delta):
#	if Input.is_action_pressed("flipper_left"):
#		#print("lol hi")
#		#get_node("Ramp").set_surface_material(0, "res://Materials/Flipper_Red.tres")
#		$Tween.interpolate_property(self, "rotation_degrees", [0,0,0], [0,0,60], 0,5)
#		$Tween.start()
#		print(self.get_rotation_degrees())

		#get_node("Ramp").set_surface_material(0, "res://Materials/Flipper.tres")


func _input(event):
	if event.is_action_pressed("flipper_left"):
		get_node("Ramp").set_surface_material(0, load("res://Materials/Flipper_Red.tres"))
	if event.is_action_released("flipper_left"):
		get_node("Ramp").set_surface_material(0, load("res://Materials/Flipper.tres"))



export (float) var thrust_speed = 750
export (float) var target_rotation = 60
#export (NodePath) var body_p
export (String) var input_action_key

#onready var body : KinematicBody = get_node(body_p)

var thrusting : bool = false

func _physics_process(delta):
	thrusting = Input.is_action_pressed(input_action_key)
	if thrusting:
		self.rotation_degrees.z = min(target_rotation, self.rotation_degrees.z + thrust_speed * delta)
	else:
		self.rotation_degrees.z = max(0, self.rotation_degrees.z - thrust_speed * delta)
