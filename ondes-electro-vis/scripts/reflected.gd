extends Node3D

@export var interfaceController: InterfaceController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)


func _notify() -> void:
	if interfaceController.parallel:
		rotation.z = 0
	else:
		rotation.z = PI/2

	scale.x = interfaceController.reflectionCoef
	
	rotation.y = -interfaceController.angle
