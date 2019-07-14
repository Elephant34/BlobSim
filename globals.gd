extends Node2D

var blob_data = load_game_data()

func load_game_data():
	# Opens the game data file to load the values

	var game_save = File.new()
	
	# If the data is blank
	if not game_save.file_exists("user://blobSave.save"):
		return {}
	
	game_save.open("user://blobSave.save", File.READ)

	var data = parse_json(game_save.get_line())

	game_save.close()

	return data

func save_game_data():
	# Stores the game data to a persistant file

	var game_save = File.new()

	game_save.open("user://blobSave.save", File.WRITE)

	game_save.store_line(to_json(blob_data))

	game_save.close()

func _ready():
	# Start the game
	if not blob_data:
		print("New blob")
	else:
		var home = load("res://home/homeScene.tscn").instance()
		add_child(home)

func _notification(what):
	# If the game is being closed
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_game_data()
		get_tree().quit() # default behavior