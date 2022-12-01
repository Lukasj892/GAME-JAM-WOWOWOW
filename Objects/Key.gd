extends Area

onready var keyLabel = get_node_or_null("/root/Game/Player/Pivot/Camera/Keys/Border/BG/Text")

func _ready():
	pass

func _on_key_body_entered(body):
	if keyLabel != null:
		if body.name == "Player":
			Global.keyCount += 1
			keyLabel.text = "Froot Friends: " + str(Global.keyCount)
			self.queue_free()


