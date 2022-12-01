extends KinematicBody

onready var Camera = $Pivot/Camera

var gravity = -30
var cur_speed = 8
var run_speed = 8
var sprint_speed = 13
var mouse_sensitivity = 0.005
var mouse_range = 1.2

var velocity = Vector3()

func get_input():
	var input_dir = Vector3()
	if Input.is_action_pressed("forward"):
		input_dir += -Camera.global_transform.basis.z
	if Input.is_action_pressed("back"):
		input_dir += Camera.global_transform.basis.z
	if Input.is_action_pressed("left"):
		input_dir += -Camera.global_transform.basis.x
	if Input.is_action_pressed("right"):
		input_dir += Camera.global_transform.basis.x
	input_dir = input_dir.normalized()
	return input_dir

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		$Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
		rotate_y(-event.relative.x * mouse_sensitivity)
		$Pivot.rotation.x = clamp($Pivot.rotation.x, -mouse_range, mouse_range)

func _physics_process(delta):
	if Input.is_key_pressed(KEY_SHIFT) and Input.is_action_pressed("forward") and $Pivot/Camera/Sprint/Border/BG/Bar.rect_scale.x >= 0.001:
		$Pivot/Camera/Sprint/Border/BG/Bar.rect_scale.x -= 0.005
		cur_speed = sprint_speed
		if $Pivot/Camera.fov < 80:
			$Pivot/Camera.fov += 2
	elif not Input.is_key_pressed(KEY_SHIFT) and $Pivot/Camera/Sprint/Border/BG/Bar.rect_scale.x <= 1:
		$Pivot/Camera/Sprint/Border/BG/Bar.rect_scale.x += 0.0025
		cur_speed = run_speed
		if $Pivot/Camera.fov > 70:
			$Pivot/Camera.fov -= 1
	else:
		cur_speed = run_speed
		if $Pivot/Camera.fov > 70:
			$Pivot/Camera.fov -= 1
	
	velocity.y += gravity * delta
	var desired_velocity = get_input() * cur_speed
	
	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	
	if Input.is_key_pressed(KEY_Q):
		#Peak Left
		if $Pivot/Camera.translation.x > -1.25:
			$Pivot/Camera.translation.x += -.125 * 2
		if $Pivot/Camera.rotation_degrees.z < 15:
			$Pivot/Camera.rotation_degrees.z += 1.5 *2
	elif Input.is_key_pressed(KEY_E):
		#Peak Right
		if $Pivot/Camera.translation.x < 1.25:
			$Pivot/Camera.translation.x += .125 * 2
		if $Pivot/Camera.rotation_degrees.z > -15:
			$Pivot/Camera.rotation_degrees.z += -1.5 *2
	else:
		#Resets camera to normal spot
		$Pivot/Camera.translation.x = 0
		$Pivot/Camera.rotation_degrees.z = 0
	
