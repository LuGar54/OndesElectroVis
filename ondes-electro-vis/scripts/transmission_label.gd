extends Label

@export var interfaceController: InterfaceController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)


func _notify() -> void:
	text = str("τ : %1.2f" % interfaceController.transmissionCoef)
