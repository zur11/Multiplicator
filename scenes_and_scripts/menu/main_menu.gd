extends Node2D



var configMenuScene = preload("res://scenes_and_scripts/menu/settings_menu.tscn")

func _ready():
	var _err1 = get_node("MarginContainer/MenuVContainer/MainMenuBtnSettings/btn").connect("pressed",self,"changeScene",[configMenuScene])


func changeScene(scene):
	SCENE_MANAGER.goToScene(scene)

