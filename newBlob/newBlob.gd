extends Node2D

var genetics = set_genetics()
var age = "0"
var generation = "0"
var hunger = "100"
var happiness = "100"
var coins = "0"
var feed = "10"
var toys = "2"

func set_genetics():
	# Sets the genetic sequence of the blob

	var genetics_string = get_colours() + get_size() + get_max_age()

	return genetics_string

func get_colours():
	# Gets the random colours
	randomize()
	var red = int(rand_range(0, 255))
	var green = int(rand_range(0, 255))
	var blue = int(rand_range(0, 255))

	var colour_list = []
	
	for i in range(red):
		colour_list.append("r")
	for i in range(green):
		colour_list.append("g")
	for i in range(blue):
		colour_list.append("b")

	return PoolStringArray(colour_list).join("")

func get_size():

	var size_list = []

	randomize()
	var small = int(rand_range(0, 100))
	var large = int(rand_range(0,100))

	for i in range(small):
		size_list.append("s")
	for i in range(large):
		size_list.append("l")

	return PoolStringArray(size_list).join("")

func get_max_age():

	var age_list = []

	randomize()
	var old = int(rand_range(0,100))
	var young = int(rand_range(0, 100))

	for i in range(old):
		age_list.append("o")
	for i in range(young):
		age_list.append("y")

	return PoolStringArray(age_list).join("") 

func _ready():
	$ColorRect.color = Color(globals.decode_colour(genetics))

func _on_Cancel_pressed():
	get_tree().quit()


func _on_CreateBlob_pressed():

	var name = $LineEdit.get_text()

	print(name)

	if not name:
		return

	globals.blob_data["age"] = age
	globals.blob_data["generation"] = generation
	globals.blob_data["hunger"] = hunger
	globals.blob_data["happiness"] = happiness
	globals.blob_data["coins"] = coins
	globals.blob_data["feed"] = feed
	globals.blob_data["toys"] = toys
	globals.blob_data["genetics"] = genetics

	globals.blob_data["name"] = name

	globals.save_game_data()

	var home = load("res://home/homeScene.tscn").instance()
	get_tree().get_root().add_child(home)
	self.queue_free()

	return
