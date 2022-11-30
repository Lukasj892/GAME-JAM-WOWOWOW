extends Control




func _on_Play_pressed():
	get_tree().change_scene("res://Game.tscn")


func _on_HowTo_pressed():
	get_tree().change_scene("res://UI/HowToPlay.tscn")


func _on_Quit_pressed():
	get_tree().quit()
