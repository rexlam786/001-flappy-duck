extends RigidBody2D

signal game_over

#func _ready() -> void:
	#print("Pipe Ready")




func _on_area_2d_body_entered(_body: Node2D) -> void:
	print("Game Over ")
	game_over.emit()
