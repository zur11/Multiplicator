extends Control


var menu = preload("res://scenes_and_scripts/menu/main_menu.tscn")

func _ready() -> void:
	SCENE_MANAGER.goToScene(menu)
