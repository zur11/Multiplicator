extends Node2D


func goToScene(sceneToGo: PackedScene, mainScenePath:String = "/root/Main/Control/MainContainer"):

	var mainContainer = get_node(mainScenePath)
	var previousScene
	
	if mainContainer.get_child_count() > 0:
		previousScene = mainContainer.get_child(mainContainer.get_child_count()-1)
		previousScene.call_deferred('free')
	var sceneToGoInstance = sceneToGo.instance()
	print(sceneToGoInstance)
	mainContainer.add_child(sceneToGoInstance)
