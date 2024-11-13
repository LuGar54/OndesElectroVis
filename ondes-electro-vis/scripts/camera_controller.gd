extends Node3D

const ROTATION_SPEED = 0.001
const ZOOM_SPEED = 1

var vertical: Node3D
var cam: Node3D

var rightMousePressed: bool = false

var mouseOver: bool = false

func _ready():
	vertical = get_child(0)
	cam = vertical.get_child(0)


func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_LEFT && !mouseOver:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				rightMousePressed = true
			if rightMousePressed:
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					print("Scroll wheel up", event.factor)
					cam.position.z -= ZOOM_SPEED * event.factor
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					print("Scroll wheel down", event.factor)
					cam.position.z += ZOOM_SPEED * event.factor
		elif !event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			rightMousePressed = false
			print("Released Right mouse button")
	elif event is InputEventMouseMotion and rightMousePressed:
		vertical.rotate_x(-event.relative.y * ROTATION_SPEED)
		rotate_y(-event.relative.x * ROTATION_SPEED)


func _on_mouse_entered() -> void:
	mouseOver = true
	print(mouseOver)


func _on_mouse_exited() -> void:
	mouseOver = false
	print(mouseOver)
