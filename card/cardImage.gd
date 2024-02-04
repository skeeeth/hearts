extends AnimatedSprite2D
class_name CardImage

var bobAmplitude:float = 0
var bobCycle = 2.0
var bobProgress:float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y = sin(lerp(0.0,TAU,bobProgress/bobCycle)) * bobAmplitude
	bobProgress += delta
	if bobProgress > bobCycle:
		bobProgress -= bobCycle;
	pass
