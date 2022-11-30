extends Control


func _ready():
	$BG/Label.text = "Congratulations! You found " + str(Global.keyCount) + " of 4 possible keys!"
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()
