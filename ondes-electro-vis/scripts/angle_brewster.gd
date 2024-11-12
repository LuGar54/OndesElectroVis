extends Label


@export var interfaceController: InterfaceController


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)
	

func _notify() -> void:
	if interfaceController.parallel:
		text = str("θB : %1.2f" % rad_to_deg(atan(interfaceController.n2/interfaceController.n1)))
	else:
		text = "θB : -"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
