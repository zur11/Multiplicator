extends Node2D

signal BackgroundChanged

const FOGGY_BACKGROUND = ["Foggy", "res://scenes_and_scripts/background/foggy_background.tscn"]
const PARALLAX_BACKGROUND = ["Parallax","res://scenes_and_scripts/background/parallax_background.tscn"]
const POSIBLE_BACKGROUNDS = [
	FOGGY_BACKGROUND, 
	PARALLAX_BACKGROUND
	]

onready var answerOptionsArrange = generateAllAnswerOptions()

onready var user_config_file = File.new()
onready var user_config_file_path = "user://config.save"
onready var selected_background = read_selected_background_from_file() setget selected_background_set


func _ready():
	pass 


func selected_background_set(new_value):
	write_selected_background_to_file(new_value)
	emit_signal("BackgroundChanged",new_value[1])
	selected_background = new_value
	print(new_value)

func write_selected_background_to_file(selected_background_to_write):
	user_config_file.open(user_config_file_path, File.WRITE)
	user_config_file.store_var(selected_background_to_write)
	user_config_file.close()

func read_selected_background_from_file():
	var return_value
	if  user_config_file.file_exists(user_config_file_path):
		user_config_file.open(user_config_file_path, File.READ)
		return_value = user_config_file.get_var()
		user_config_file.close()
	else:
		return_value = FOGGY_BACKGROUND
	return return_value

func generateAllAnswerOptions():
	var answerOptionsInnerArrange = []
	for ii in range(11):
		for jj in range(ii, 11):
			if !answerOptionsInnerArrange.has(ii*jj):
				answerOptionsInnerArrange.append(ii*jj)
	print(answerOptionsInnerArrange.size())
	return answerOptionsInnerArrange

