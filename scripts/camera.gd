extends CharacterBody3D


var SPEED = 25.0
const JUMP_VELOCITY = 4.5
@onready var cam_tex: TextEdit = $"../Gui/VBoxContainer/camera/cam-tex"

@onready var head: CharacterBody3D = $"."
@onready var camera: Camera3D = $Camera3D
var SENSITIVITY = 0.01
func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion:
			head.rotate_y(-event.relative.x * SENSITIVITY)
			camera.rotate_x(-event.relative.y * SENSITIVITY)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	$"../Gui/campos".text = str(Vector3i(position)) + " cam pos"
	var multi = float(cam_tex.text)
	SPEED = 25 * multi
	if not is_on_floor():
		#velocity += get_gravity() * delta
		pass
	if Input.is_action_pressed("space"):
		velocity -= get_gravity() * multi * delta
	elif Input.is_action_pressed("shift") == false:
		velocity.y = 0
	if Input.is_action_pressed("shift"):
		velocity += get_gravity() * multi * delta
	elif Input.is_action_pressed("space") == false:
		velocity.y = 0
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()


func _on_set_button_down() -> void:
	$"../Gui/VBoxContainer/camera/cam-tex".focus_mode = false
	$"../Gui/VBoxContainer/camera/cam-tex".focus_mode = true
	pass # Replace with function body.
