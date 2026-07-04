extends Node2D


@export var direction = Vector2.LEFT
@export var velocity = 300

signal score


var pipe_scene = preload("res://scenes/pipe.tscn")
#const GAME_OVER = preload("uid://d1lpcr33sot8q")

func _on_timer_timeout() -> void:
	#print("Timeout")
	var pipe_bottom = pipe_scene.instantiate()
	pipe_bottom.position = $PipeSpawn.position	- Vector2(0,randf()*300)
	pipe_bottom.linear_velocity = velocity * direction 
	pipe_bottom.game_over.connect(_on_game_over)
	
	var pipe_top = pipe_scene.instantiate()
	pipe_top.position = pipe_bottom.position - Vector2(0,800)
	pipe_top.linear_velocity = velocity * direction 
	pipe_top.game_over.connect(_on_game_over)

	$Pipes.add_child(pipe_bottom)
	$Pipes.add_child(pipe_top)
	score.emit()
	
func _on_game_over():
	#print(Autoload.final_score)
	#Autoload.final_score = 5
	call_deferred("_change_scene")

func _change_scene():
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")


func _on_killzone_body_entered(_body: Node2D) -> void:
	call_deferred("_change_scene")
