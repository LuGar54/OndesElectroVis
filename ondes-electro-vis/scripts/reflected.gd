extends Node3D


@export var interfaceController: InterfaceController


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)


func _notify() -> void:
	rotation.y = -interfaceController.angle
