extends Node3D


var rightMousePressed: bool = false
var initialMousePosition: Vector2

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == MOUSE_BUTTON_RIGHT:
				initialMousePosition = event.position
				Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
				rightMousePressed = true
				print("Right mouse button")
			if rightMousePressed:
				if event.button_index == MOUSE_BUTTON_WHEEL_UP:
					print("Scroll wheel up", event.factor)
				if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
					print("Scroll wheel down", event.factor)
		elif !event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
			#Input.warp_mouse(initialMousePosition)
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			rightMousePressed = false
			print("Released Right mouse button")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rightMousePressed:
		Input.warp_mouse(initialMousePosition)
	pass
