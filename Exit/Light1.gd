extends Area

func _ready():
	$Light.light_color = Color(1,0,0,1) #Red

func unlock():
	$Light.light_color = Color(0,1,0,1) #Green

func _physics_process(_delta):
	if Global.keyCount >= 1:
		unlock()
