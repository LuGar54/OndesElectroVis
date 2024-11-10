extends Node3D

const ROTATION_SPEED = 0.001
const ZOOM_SPEED = 1

var vertical: Node3D
var cam: Node3D

var rightMousePressed: bool = false

func _ready():
	vertical = get_child(0)
	cam = vertical.get_child(0)


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_RIGHT:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				rightMousePressed = true
				print("Right mouse button")
			if rightMousePressed:
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					print("Scroll wheel up", event.factor)
					cam.position.z -= ZOOM_SPEED * event.factor
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					print("Scroll wheel down", event.factor)
					cam.position.z += ZOOM_SPEED * event.factor
		elif !event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			rightMousePressed = false
			print("Released Right mouse button")
	elif event is InputEventMouseMotion and rightMousePressed:
		print(event.relative)
		vertical.rotate_x(-event.relative.y * ROTATION_SPEED)
		rotate_y(event.relative.x * ROTATION_SPEED)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
