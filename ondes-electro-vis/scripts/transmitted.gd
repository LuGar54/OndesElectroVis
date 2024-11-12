extends Node3D

@export var interfaceController: InterfaceController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)


func _notify() -> void:
	rotation.y = interfaceController.angle2
	scale.x = 2 * interfaceController.n2 * cos(interfaceController.angle)/(interfaceController.n2 * cos(interfaceController.angle2) + interfaceController.n1 * cos(interfaceController.angle))
