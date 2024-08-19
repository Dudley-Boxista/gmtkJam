extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0
const GRAVITY = 1500


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.y += GRAVITY * delta

	# Handle jump.
	var jump = Input.is_action_just_pressed("Pulo")
	#variavel pra definir que soltei o pulo 
	var jump_stop = Input.is_action_just_released("Pulo")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor():
		if jump:
#velocidade do pulo pra cima
			velocity.y = JUMP_VELOCITY
#velocidade do pulo pra baixo
	elif jump_stop and velocity.y<0: 
#se eu soltei o pulo e a velocidade não chegou a 0 (não parou)
			velocity.y *= 0.5
 #Eu "freio" o personagem porque corto a velocidade
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
