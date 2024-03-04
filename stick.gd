extends StaticBody2D

var press_pos
var release_pos
var dragging:bool
var end_pos
var move:bool
var drag_vector 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		
		if event.button_index == MOUSE_BUTTON_LEFT:
			move =false
			if  event.pressed:
				dragging=true
				press_pos = event.position
				print("Start drag at %s" % press_pos)
				
			else:
				dragging=false
				release_pos=event.position
				
				drag_vector = end_pos - press_pos
				move = true 
				$MoveTimer.start()
				
				
			pass
		 
		
	elif event is InputEventMouseMotion and dragging:
		end_pos = event.position
		var drag_vector = end_pos - press_pos
		
		rotation = (-drag_vector).angle()
		
		position=press_pos+ 0.2 *drag_vector
		
		

   # Print the size of the viewport.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if move:
		constant_linear_velocity = - 10*drag_vector
		position -= delta*drag_vector*10
	else:
		constant_linear_velocity = Vector2(0,0)
	pass



func _on_move_timer_timeout():
	move =false 
	pass # Replace with function body.
