extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# Sets the labels data values
	$Name.set_text("Name: " + globals.blob_data.name)
	$Generation.set_text("Generation: " + globals.blob_data.generation)
	$Hunger.set_text("Hunger: " + globals.blob_data.hunger)
	$Happiness.set_text("Happiness: " + globals.blob_data.happiness)
	$Age.set_text("Age: " + globals.blob_data.age)

	get_node("Feed/Feed_Amount").set_text("x" + globals.blob_data.feed)
	get_node("Toy/Toy_Amount").set_text("x" + globals.blob_data.toys)
