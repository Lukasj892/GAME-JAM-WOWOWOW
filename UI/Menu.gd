extends Control



func _on_Button_pressed():
	get_tree().quit()


func _on_Resume_pressed():
	get_tree().paused = false
	self.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
