extends Node2D



var configMenuScene = load("res://scenes_and_scripts/menu/settings_menu.tscn")

func _ready():
	var _btnToSettings = get_node("MarginContainer/MenuVContainer/BtnToSettings/btn").connect("pressed",self,"changeScene",[configMenuScene])

func changeScene(scene):
	Transition.changeSceneLoc(scene)


func _on_Btn_To_Quit_pressed():
	get_tree().quit()
