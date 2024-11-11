extends PanelContainer
var n1: float = 1
var n2: float = 1
var angle: float = 0
var angle2: float = 0

var notifyList = []


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_n_1_text_changed(new_text: String) -> void:
	print("allo")
	if new_text == "":
		n1 = 1
	else:
		n1 = float(new_text)
	print(notifyList)
	for notify in notifyList:
		notify._adjust_size()


func _on_n_2_text_changed(new_text: String) -> void:
	if new_text == "":
		n2 = 1
	else:
		n2 = float(new_text)
	for notify in notifyList:
		notify._adjust_size()


func _on_angle_text_changed(new_text: String) -> void:
	#if float(new_text) > 90:
		#new_text = "90"
	
	angle = deg_to_rad(float(new_text))
	angle2 = asin(n1/n2 * sin(angle))
	for notify in notifyList:
		notify._adjust_size()
