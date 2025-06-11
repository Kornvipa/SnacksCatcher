extends Area2D

const SPEED : float = 400.0




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("move_left"):
		#position.x -= SPEED * delta
	#if Input.is_action_pressed("move_right"):
		#position.x += SPEED * delta
	#
	var movement:float = Input.get_axis("move_left", "move_right")
	position.x += SPEED * delta * movement	
	
	position.x = clampf(position.x,
	Game.get_vpr().position.x,
	Game.get_vpr().end.x)	
	#var jump : float = Input.is_action_pressed("jump")
	#position.y -= 30 * jump * delta
	#position.y = clampf(position.y,position.y, position.y + 750)




func _on_area_entered(area: Area2D) -> void:
	print('Snack time!', area)
