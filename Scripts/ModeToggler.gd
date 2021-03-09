extends Node2D

onready var editModeScene = load('res://Scenes/EditMode.tscn')
onready var playModeScene = load('res://Scenes/PlayMode.tscn')

onready var selectEditMode = get_node("SelectEdit")
onready var selectPlayMode = get_node("SelectPlay")

var editMode
var playMode

func _ready():
	editMode = editModeScene.instance()
	playMode = playModeScene.instance()
	self.add_child(editMode)
	self.move_child(editMode, self.get_child_count() - 1)
	self.add_child(playMode)
	self.move_child(playMode, self.get_child_count() - 1)
	playMode.hide()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_SelectEdit_pressed():
	playMode.hide()
	editMode.show()
	selectPlayMode.self_modulate = Color(1, 1, 1)
	selectEditMode.self_modulate = Color(0.7, 0.7, 0.7)
	pass # Replace with function body.


func _on_SelectPlay_pressed():
	editMode.hide()
	playMode.show()
	selectEditMode.self_modulate = Color(1, 1, 1)
	selectPlayMode.self_modulate = Color(0.7, 0.7, 0.7)
	pass # Replace with function body.
