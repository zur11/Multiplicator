extends Node2D

	

func _ready() -> void:
	pass

func changeScene(scene):
	SceneManager.goToScene(scene)
