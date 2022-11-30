extends Spatial

onready var menu = get_node_or_null("/root/Game/UI/Menu")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	menu.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
