extends Node2D

class_name Game

var adfkael;fiagkn
afe

const SNACK = preload("res://Scenes/Snacks/Snacks.tscn")
@onready var spawn_timer: Timer = $SpawnTimer
@onready var game_bg: Sprite2D = $GameBg
@onready var doggo: Area2D = $Doggo
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
const EXPLODE = preload("res://assets/explode.wav")
@onready var sound: AudioStreamPlayer = $Sound
@onready var score_label: Label = $ScoreLabel

var _score: int = 0
static var _vp_r : Rect2

static func get_vpr() -> Rect2:
	return _vp_r


func spawn_snack() -> void:
	var new_snack: Snackeru = SNACK.instantiate()
	new_snack.position = Vector2(randf_range(get_viewport_rect().position.x+100,get_viewport_rect().end.x-100), -50.0)
	new_snack.snack_off_screen.connect(_on_snack_off_screen)
	add_child(new_snack)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_vp()
	get_viewport().size_changed.connect(update_vp)
	spawn_snack()


func update_vp() -> void:
	_vp_r = get_viewport_rect()

func _on_doggo_area_entered(area: Area2D) -> void:
	print('score',area)
	_score += 1 
	print('score')
	score_label.text = "%03d" % _score
	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()
	
	
	
func _on_snack_off_screen() -> void:
	stop_all()

func _on_timer_timeout() -> void:
	spawn_snack()

func stop_all() -> void:
	sound.stop()
	sound.stream = EXPLODE
	sound.play()
	spawn_timer.stop()
	doggo.set_process(false)
	for child in get_children():
		if child is Snackeru:
			child.set_process(false)
	_score = 0
