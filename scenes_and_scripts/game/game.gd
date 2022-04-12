extends CanvasLayer

onready var correctPercentage = $MarginContainer/GameVContainer/ScoreHContainer/ScorePercent
onready var totalScore = $MarginContainer/GameVContainer/ScoreHContainer/TotalScoreContainer/TotalScoreLabel
onready var question = $MarginContainer/GameVContainer/QuestionContainer/QuestionLabel
onready var audioEffectsPlayer = $MarginContainer/GameVContainer/AudioStreamPlayer
onready var correctEffect = preload("res://assets/audio/correct.mp3")
onready var wrongEffect = preload("res://assets/audio/error.mp3")

onready var optionsBtnsArrange = [
	$MarginContainer/GameVContainer/Options/OptionsHContainer/OptionsVContainer/OptionBtn1,
	$MarginContainer/GameVContainer/Options/OptionsHContainer/OptionsVContainer/OptionBtn2,
	$MarginContainer/GameVContainer/Options/OptionsHContainer/OptionsVContainer2/OptionBtn3,
	$MarginContainer/GameVContainer/Options/OptionsHContainer/OptionsVContainer2/OptionBtn4
]

var tries = 0
var rightAnswers = 0
var percentage = 0

var correctValue

var answerOptionsArrange = GlobalValues.generateAllAnswerOptions()

func _ready():
	newQuestion()
	for optionBtn in optionsBtnsArrange:
		optionBtn.connect("chosenAnswer", self, "evalueAndRestart")

func evalueAndRestart(receivedValFromOptionPressed):
	var rightAnswer
	if receivedValFromOptionPressed == correctValue:
		rightAnswer = true
	else:
		rightAnswer = false
	newQuestion()
	if rightAnswer == true:
		audioEffectsPlayer.stream = correctEffect 
		
		audioEffectsPlayer.play()
		rightAnswers += 1
	else:
		audioEffectsPlayer.stream = wrongEffect
		audioEffectsPlayer.play()
	tries += 1
	percentage = float(rightAnswers) / float(tries) * 100
	correctPercentage.value = percentage 
	totalScore.text = str(rightAnswers) + " / " + str(tries)

func newQuestion():
	randomize()
	var randomMultiplier1 = randi()%11
	var randomMultiplier2 = randi()%11
	var correctOption = randi()%4
	var options = [0,0,0,0]
	options[correctOption] = randomMultiplier1 * randomMultiplier2
	for ii in 4:
		if ii != correctOption:
			var newOption = randi()%answerOptionsArrange.size()
			#print(newOption)
			while options.has(newOption):
				newOption = randi()%answerOptionsArrange.size()
			options[ii] = answerOptionsArrange[newOption]
	for ii in 4:
		optionsBtnsArrange[ii].startInNewQuestion(options[ii])
	correctValue = randomMultiplier1 * randomMultiplier2
	question.text = "Cuanto es \n"+str(randomMultiplier1)+"X "+str(randomMultiplier2)
