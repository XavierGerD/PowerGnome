extends Node2D

onready var songTitleNode = get_node("SongTitle")
onready var songMarkerScroller = get_node("MarkerHolder/VBoxContainer")

onready var songMarkerTitleNode = load('res://Scenes/SongMarker.tscn')
onready var scrollButtonScript = load('res://Scripts/ScrollButton.gd')
onready var metronomeNode = load('res://Scenes/Metronome.tscn')

onready var metronome
var isPlaying = false

func countDownAndPlay(i):
	if !isPlaying:
		metronome = metronomeNode.instance()
		self.add_child(metronome)
		metronome.playAndCount(i)
		isPlaying = true
	else:
		metronome.queue_free()
		isPlaying = false

func createSongMarker(bar, i):
	var songMarkerButton = Button.new()
	songMarkerButton.set_script(scrollButtonScript)
	songMarkerButton.set_custom_minimum_size(Vector2(2560, 300))
	Global.setColorAndRadius(songMarkerButton, bar.color)
	var songMarkerTitle = songMarkerTitleNode.instance()
	songMarkerTitle.get_child(0).append_bbcode("	[center]" + str(bar.markerName) + "[/center]\n")
	songMarkerButton.add_child(songMarkerTitle)
	songMarkerButton.connect('Scroll_Button_Pressed', self, 'countDownAndPlay', [i])
	return songMarkerButton


func _ready():
	songTitleNode.text = Global.song.title
	#self.add_child(metronome)
	for i in len(Global.song.bars):
		if Global.song.bars[i].markerName != '':
			var barMarker = createSongMarker(Global.song.bars[i], i)
			songMarkerScroller.add_child(barMarker)
