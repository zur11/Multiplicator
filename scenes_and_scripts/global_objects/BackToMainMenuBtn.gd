extends TextureButton

var menuScene = load("res://scenes_and_scripts/menu/main_menu.tscn")

func _ready():
	var err = self.connect("pressed",self,"goToMenu")
	if err != OK:
		print("Failure!")

func goToMenu():
	SceneManager.goToScene(menuScene)
