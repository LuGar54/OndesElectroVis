extends Node3D


var n1: float = 1
var n2: float = 1
var angle: float = 0
var angle2: float = 0

var incident: Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	incident = $Incident


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _adjust_size() -> void:
	angle2 = asin(n1/n2 * sin(angle))
	rotation.y = angle2
	scale.x = 2 * n2 * cos(angle)/(n2 * cos(angle2) + n1 * cos(angle))


func _on_n_1_text_changed(new_text: String) -> void:
	if new_text == "":
		n1 = 1
	else:
		n1 = float(new_text)
	_adjust_size()


func _on_n_2_text_changed(new_text: String) -> void:
	if new_text == "":
		n2 = 1
	else:
		n2 = float(new_text)
	_adjust_size()


func _on_angle_text_changed(new_text: String) -> void:
	#if float(new_text) > 90:
		#new_text = "90"
	
	angle = deg_to_rad(float(new_text))
	_adjust_size()
