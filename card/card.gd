class_name Card
extends Node2D

var value:int = 0;
var facedown:bool = true
var startFrame:int
var flipping:bool = false
@onready var image:CardImage = $Image

# Called when the node enters the scene tree for the first time.
func _ready():
	if randi_range(0,1) == 1:
		flip()
	startFrame = value-1;
	set_image()
	value = value % 13;
	if value == 0: value = 10;
	if value > 10: value = 10;
	if value == 1: value = 11;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func on_value_changed(v,hand):
	if v > 21:
		if value == 11:
			if hand.value > 21:
				value -= 10
				hand.value -= 10;

func flip():
	if flipping:
		return
	flipping = true
	var flipTween = create_tween()
	flipTween.tween_property(self,"transform:x:x",
	0,0.3)
	flipTween.tween_property(self,"transform:x:x",
	2,0.3)
	flipTween.set_trans(Tween.TRANS_CIRC);
	await flipTween.step_finished
	scale.y = 2
	facedown = !facedown
	set_image();
	flipping = false

func set_image():
	if facedown: image.frame = 52
	else: image.frame = startFrame;
