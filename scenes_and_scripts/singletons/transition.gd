extends CanvasLayer

onready var animPlay : AnimationPlayer = $TransitionPlayer

func changeSceneLoc(scene : PackedScene) -> void:
	layer = 1
	
	#fade in
	animPlay.play("fade")
	yield(animPlay,"animation_finished")
	
	#cambio de escena
	SceneManager.goToScene(scene)
	
	#fade out
	animPlay.play_backwards("fade")
	yield(animPlay,"animation_finished")
	layer = 0

func _ready() -> void:
	layer = 0


