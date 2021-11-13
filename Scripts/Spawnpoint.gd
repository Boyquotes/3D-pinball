extends Position3D


func _spawn_new_ball():
	add_child(load("res://Scenes/Ball.tscn").instance())

func _ready():
	_spawn_new_ball()


func _on_Area_Kill_body_exited(body):
	if body.get_collision_layer() == 2:
		body.queue_free()
		_spawn_new_ball()
