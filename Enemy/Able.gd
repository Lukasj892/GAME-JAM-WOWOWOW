extends KinematicBody

var path = []
var path_node = 0
var line_of_sight = false
var speed = 4

onready var nav = get_parent()
onready var player = get_node("/root/Game/Player")
onready var ray = $RayCast

func _process(_delta):
	if player != null:
		ray.cast_to = ray.to_local(player.global_transform.origin) #Sends raycast towards player.
		var c = ray.get_collider()
		speed = 4
		if c and c.name == "Player": #If raycast hits player...
			speed = 10

func _physics_process(_delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node += 1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)

func move_towards(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func _on_Timer_timeout():
	move_towards(player.global_transform.origin)

func _on_Area_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://UI/DeathScene.tscn")
