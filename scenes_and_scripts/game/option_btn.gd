extends Button

signal chosenAnswer(value)

var myValue:int

func _ready():
	var err = self.connect("pressed", self, "sendMyValue")
	if err != 0:
		print('error found')

func sendMyValue():
	emit_signal("chosenAnswer", myValue)


func startInNewQuestion(myIntValue: int):
	myValue = myIntValue

	self.set_size(Vector2(49, 57))
	self.text = str(myValue)
