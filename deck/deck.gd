class_name Deck
extends Node2D

var cardScene = preload("res://card/card.tscn")
var remaining = []
# Called when the node enters the scene tree for the first time.
func _ready():
	generate();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func draw_card(parent:Node)->Card:
	if remaining.size() == 0:
		generate()
	var drawnNum = remaining.pick_random();
	remaining.erase(drawnNum);
	var newCard = cardScene.instantiate();
	newCard.value = drawnNum;
	parent.add_child(newCard);
	return newCard
	
func generate():
	for i in range (1,53):
		remaining.append(i);




func _on_texture_rect_gui_input(event):
	draw_card(get_parent())
	pass # Replace with function body.
