extends Node

func _ready():
	# Start the game
	if not globals.blob_data:
		print("New blob")
	else:
		var home = load("res://home/homeScene.tscn").instance()
		add_child(home)
