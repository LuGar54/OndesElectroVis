extends Node3D


@export var interfaceController: InterfaceController


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interfaceController.notifyList.append(self)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _notify() -> void:
	if interfaceController.parallel:
		rotation.z = 0
	else:
		rotation.z = PI/2

	rotation.y = interfaceController.angle
