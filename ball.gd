extends RigidBody2D
var dragging
var drag_offset
var speed = 400
@export var pickable:bool
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if not pickable:
		return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				var local_mouse_position = get_local_mouse_position()
				if $CollisionShape2D.shape.radius > local_mouse_position.length():
					dragging = true
					drag_offset = local_mouse_position
			else:
				dragging = false
	elif event is InputEventMouseMotion:
		if dragging:
			var target_position = get_global_mouse_position() - drag_offset
			var direction = target_position - global_position
			linear_velocity = direction.normalized() * speed  # Adjust 'speed' as needed
