extends Node

func _ready():
	# Start the game
	if not globals.blob_data:
		var new_blob = load("res://newBlob/newBlob.tscn").instance()
		add_child(new_blob)
	else:
		var home = load("res://home/homeScene.tscn").instance()
		add_child(home)
