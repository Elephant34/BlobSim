extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():

	globals.blob_data = {}
	globals.save_game_data()
	
	globals.stop_timers()


func _on_Quit_pressed():
	get_tree().quit()


func _on_NewBlob_pressed():
	globals.reset = true
	var new_blob = load("res://newBlob/newBlob.tscn").instance()
	get_tree().get_root().add_child(new_blob)
	
	self.queue_free()
