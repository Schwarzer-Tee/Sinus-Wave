extends GridMap
@export var refreshrate = 0.1
#@export var accuracy = 1
@export var frequency = 0.2
@export var depth = 7
@export var sizex = 50
@export var sizez = 50

var counter = 0
@onready var timer: Timer = $"../Timer"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"../Gui/VBoxContainer/depth/depth-tex".text = str(depth)
	$"../Gui/VBoxContainer/frequency/frequency-tex".text = str(frequency)
	$"../Gui/VBoxContainer/refreshrate/refreshrate-tex".text = str(timer.wait_time)
	$"../Gui/VBoxContainer/sizex/sizex-tex".text = str(sizex)
	$"../Gui/VBoxContainer/sizez/sizez-tex".text = str(sizez)
	$"../Gui/VBoxContainer/camera/cam-tex".focus_mode = false
	$"../Gui/VBoxContainer/camera/cam-tex".focus_mode = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down") || Input.is_action_pressed("shift") || Input.is_action_pressed("space"):
		$"../Gui/VBoxContainer/depth/depth-tex".focus_mode = false
		$"../Gui/VBoxContainer/depth/depth-tex".focus_mode = true
		$"../Gui/VBoxContainer/frequency/frequency-tex".focus_mode = false
		$"../Gui/VBoxContainer/frequency/frequency-tex".focus_mode = true
		$"../Gui/VBoxContainer/refreshrate/refreshrate-tex".focus_mode = false
		$"../Gui/VBoxContainer/refreshrate/refreshrate-tex".focus_mode = true
		$"../Gui/VBoxContainer/sizex/sizex-tex".focus_mode = false
		$"../Gui/VBoxContainer/sizex/sizex-tex".focus_mode = true
		$"../Gui/VBoxContainer/sizez/sizez-tex".focus_mode = false
		$"../Gui/VBoxContainer/sizez/sizez-tex".focus_mode = true
		
	pass
func sinwave(count):
	clear()
	for x in range(-sizex/2, sizex/2):
		for z in range(-sizez/2, sizez/2):
			var sinx = sin((x+count)*frequency) * depth
			var cosy = cos((z+count)*frequency) * depth
			sinx = (sinx + cosy) / 2   
			set_cell_item(Vector3i(x,sinx,z),0)
			pass


func _on_timer_timeout() -> void:
	sinwave(counter)
	counter += 1
	if counter > 9223372036854775800:
		counter = 0
	pass # Replace with function body.
	$"../Gui/fps".text = str(Engine.get_frames_per_second()) + " fps"



func _on_set_button_down() -> void:
	depth = int($"../Gui/VBoxContainer/depth/depth-tex".text)
	frequency = float($"../Gui/VBoxContainer/frequency/frequency-tex".text)
	timer.wait_time = float($"../Gui/VBoxContainer/refreshrate/refreshrate-tex".text)
	sizex = int($"../Gui/VBoxContainer/sizex/sizex-tex".text)
	sizez = int($"../Gui/VBoxContainer/sizez/sizez-tex".text)
	
	pass # Replace with function body.
