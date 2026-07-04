extends Control

@onready var display_score: Label = $PanelContainer2/Score
#@onready var main: Node2D = $"."

func _ready():
	#main.score.connect(_score_increment)
	#_score_increment(current_score)
	display_score.text = "Final Score: " + str(Autoload.final_score)
	

func _on_button_pressed() -> void:
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
