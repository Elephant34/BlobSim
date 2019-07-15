extends Node2D

var blob_size = globals.decode_size(globals.blob_data.genetics)

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets the labels data values
	$Name.set_text("Name: " + globals.blob_data.name)
	$Generation.set_text("Generation: " + globals.blob_data.generation)
	$Hunger.set_text("Hunger: " + globals.blob_data.hunger)
	$Happiness.set_text("Happiness: " + globals.blob_data.happiness)
	$Age.set_text("Age: " + globals.blob_data.age)

	$Feed/Feed_Amount.set_text("x" + globals.blob_data.feed)
	$Toy/Toy_Amount.set_text("x" + globals.blob_data.toys)

	$Blob.color = Color(globals.decode_colour(globals.blob_data.genetics))

	if blob_size <= 0:
		blob_size = 5
	elif blob_size > 100:
		blob_size = 100

	print(blob_size-globals.DEFAULT_SIZE)
	print((-(float(blob_size)-float(globals.DEFAULT_SIZE))/2)+20)

	$Blob.rect_size.x = blob_size
	$Blob.rect_size.y = blob_size

	$Blob.rect_position.y -= (blob_size / 2) - ((-(float(blob_size)-float(globals.DEFAULT_SIZE))/2)+20)
	#$Blob.rect_position.y -= (blob_size / 2) - 19.5

	$Blob/Outline.rect_size.x = blob_size + 6
	$Blob/Outline.rect_size.y = blob_size + 6


func _on_Feed_pressed():
	if int(globals.blob_data.hunger) + 10 > 100 or int(globals.blob_data.feed) == 0:
		return
	globals.blob_data.hunger = str(int(globals.blob_data.hunger)+10)
	globals.blob_data.feed = str(int(globals.blob_data.feed)-1)

	$Hunger.set_text("Hunger: " + globals.blob_data.hunger)
	$Feed/Feed_Amount.set_text("x" + globals.blob_data.feed)

	globals.save_game_data()


func _on_Toy_pressed():
	if int(globals.blob_data.happiness) + 30 > 100 or int(globals.blob_data.toys) == 0:
		return
	globals.blob_data.happiness = str(int(globals.blob_data.happiness)+30)
	globals.blob_data.toys = str(int(globals.blob_data.toys)-1)

	$Happiness.set_text("Happiness: " + globals.blob_data.happiness)
	$Toy/Toy_Amount.set_text("x" + globals.blob_data.toys)

	globals.save_game_data()
