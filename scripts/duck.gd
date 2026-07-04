extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
#const JUMP_AUDIO = preload("uid://k7erthiydt7j")
@onready var JUMP_AUDIO: AudioStreamPlayer2D = $AudioStreamPlayer2D


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
			#if files[0].get_extension() == "wav":
		#audio_player.stream = AudioStreamWAV.load_from_file(files[0], {
				#"force/max_rate": true,
				#"force/max_rate_hz": 11025
			#})
		JUMP_AUDIO.play()


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
