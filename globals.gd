extends Node

var blob_data = load_game_data()

const MAX_AGE = 100
const MIN_AGE = 5
const DEFAULT_AGE = 30

const MAX_SIZE = 100
const MIN_SIZE = 1
const DEFAULT_SIZE = 30

const int_to_hex_table = {
	0:"0",
	1:"1",
	2:"2",
	3:"3",
	4:"4",
	5:"5",
	6:"6",
	7:"7",
	8:"8",
	9:"9",
	10:"a",
	11:"b",
	12:"c",
	13:"d",
	14:"e",
	15:"f",
}

func load_game_data():
	# Opens the game data file to load the values

	var game_save = File.new()
	
	# If the data is blank
	if not game_save.file_exists("user://blobSave.save"):
		return {}
	
	game_save.open("user://blobSave.save", File.READ)

	var data = parse_json(game_save.get_as_text())

	game_save.close()

	return data

func save_game_data():
	# Stores the game data to a persistant file

	var game_save = File.new()

	game_save.open("user://blobSave.save", File.WRITE)

	game_save.store_line(to_json(blob_data))

	game_save.close()

func decode_colour(genetics):
	var red = 0
	var green = 0
	var blue = 0

	for allete in genetics:
		match allete:
			"r":
				red += 1
			"g":
				green += 1
			"b":
				blue += 1
	
	return int_to_hex(red) + int_to_hex(green) + int_to_hex(blue)

func int_to_hex(integer):

	var remainder = ""
	var hex = ""

	while integer != 0:
		remainder = integer % 16
		hex = int_to_hex_table[remainder] + hex

		integer = (integer-remainder)/16
	
	return hex

func _notification(what):
	# If the game is being closed
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		save_game_data()
		get_tree().quit() # default behavior