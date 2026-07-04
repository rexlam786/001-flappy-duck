extends PanelContainer

@onready var main: Node2D = $"../.."
@onready var display_score: Label = $Score
@onready var panel_container: PanelContainer = $"."


func _ready():
	#var final_score: int  = 
	main.score.connect(_score_increment)
	
	#_score_increment(current_score)

var current_score : int = -3

func _score_increment() -> void:
	current_score += 1.5
	print(current_score)
	if current_score > 0:
		display_score.text = "Score: " + str(current_score)
		#panel_container.anchor
	#return current_score
	Autoload.final_score = current_score
