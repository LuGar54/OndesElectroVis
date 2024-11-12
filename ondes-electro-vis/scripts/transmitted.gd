extends Node3D

@export var interfaceController: InterfaceController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)


func _notify() -> void:
	if interfaceController.parallel:
		scale.x = 2 * interfaceController.n1 * cos(interfaceController.angle)/(interfaceController.n1 * cos(interfaceController.angle2) + interfaceController.n2 * cos(interfaceController.angle))
		rotation.z = 0
	else:
		scale.x = 2 * interfaceController.n1 * cos(interfaceController.angle)/(interfaceController.n1 * cos(interfaceController.angle) + interfaceController.n2 * cos(interfaceController.angle2))
		rotation.z = PI/2

	rotation.y = interfaceController.angle2
	
