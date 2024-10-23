extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@export var speed = 10



func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
	#	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	if Input.is_action_pressed("forward"):
		self.velocity = ((get_global_transform().basis.z)*-1) * speed
		move_and_slide()
	

	move_and_slide()


func _input(event):
	if(event is InputEventMouseMotion):
		self.rotate_y(event.get_relative().y)