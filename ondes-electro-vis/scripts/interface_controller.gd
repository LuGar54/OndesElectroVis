extends PanelContainer

var n1: float = 1
var n2: float = 1
var angle: float = 0
var angle2: float = 0
var parallel: bool = true

var reflectionCoef: float = 0
var transmissionCoef: float = 1

var notifyList = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	call_deferred("_notify_list")

func _notify_list() -> void:
	for notify in notifyList:
		notify._notify()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_n_1_text_changed(new_text: String) -> void:
	if new_text == "":
		n1 = 1
	else:
		n1 = float(new_text)
		
	_recalculate_values()
	
	_notify_list()


func _on_n_2_text_changed(new_text: String) -> void:
	if new_text == "":
		n2 = 1
	else:
		n2 = float(new_text)
	
	_recalculate_values()
	
	_notify_list()


func _on_angle_text_changed(new_text: String) -> void:
	#if float(new_text) > 90:
		#new_text = "90"
	
	angle = deg_to_rad(float(new_text))
	_recalculate_values()
	
	_notify_list()


func _on_option_button_item_selected(index: int) -> void:
	parallel = index == 0
	_notify_list()


func _recalculate_values() -> void:
	angle2 = asin(n1/n2 * sin(angle))
	if parallel:	
		reflectionCoef = (n1 * cos(angle2) - n2 * cos(angle))/(n1 * cos(angle2) + n2 * cos(angle))
		transmissionCoef = 2 * n1 * cos(angle)/(n1 * cos(angle2) + n2 * cos(angle))
	else:
		reflectionCoef = (n1 * cos(angle) - n2 * cos(angle2))/(n1 * cos(angle) + n2 * cos(angle2))
		transmissionCoef = 2 * n1 * cos(angle)/(n1 * cos(angle) + n2 * cos(angle2))
