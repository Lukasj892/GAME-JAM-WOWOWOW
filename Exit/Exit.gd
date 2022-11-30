extends Area



func _on_Exit_body_entered(body):
	if body.name == "Player" and Global.keyCount >= 3:
		get_tree().change_scene("res://UI/WinScene.tscn")
