extends Area2D

class_name Snackeru

const SPEED: float = 200.0

signal snack_off_screen


# import var
@onready var burger: Sprite2D = $Burger
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func die() -> void:
		set_process(false)
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y +=SPEED*delta
	if position.y >Game.get_vpr().end.y:
		print("Dirty snack eww")
		snack_off_screen.emit()
		die()


func _on_area_entered(area: Area2D) -> void:
	print('i got eaten',area)
	die()
	
	pass # Replace with function body.
