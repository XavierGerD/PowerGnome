extends Node2D

#nodes
onready var hBoxContainerNode = get_node("SectionContainer/HBoxContainer")
onready var sectionContainerNode = get_node("SectionContainer")
onready var titleTextNode = get_node("SongTitle")

#res
onready var barInfo = load('res://Scenes/BarInformation.tscn')
onready var barInfoNode = load('res://Scenes/BarInfo.tscn')
onready var fillerBarNode = load('res://Scenes/FillerBar.tscn')
onready var modeToggler = load('res://Scenes/ModeToggler.tscn')
onready var newBarNode = load('res://Scenes/NewBar.tscn')
onready var scrollButtonScript = load('res://Scripts/ScrollButton.gd')

#global vars
var song = Global.song
onready var barInfoPopupRef = barInfo.instance()
var sixteenthNoteWidth = 30
var lastTempo = null
var lastTimeSig = []
var lastColor = ''
var totalWidth = 0

func createNewBarButton(bar):
	var button = Button.new()
	var barInfoObject = barInfoNode.instance()
	var sectionTitle = barInfoObject.get_child(0)
	var sectionTempo = barInfoObject.get_child(1)
	var barInfoTimeSignature = barInfoObject.get_child(2)

	if bar.timeSignature != lastTimeSig:
		barInfoTimeSignature.text = String(bar.timeSignature[0]) + "/" + String(bar.timeSignature[1])
		lastTimeSig = bar.timeSignature
	
	if bar.tempo != lastTempo:
		sectionTempo.text = bar.tempo
		lastTempo = bar.tempo
	
	if bar.markerName != '':
		sectionTitle.text = bar.markerName
	
	if bar.color == '':
		Global.setColorAndRadius(button, lastColor)
	else:
		Global.setColorAndRadius(button, bar.color)
		lastColor = bar.color
	
	var timeSignatureForWidth = bar.timeSignature if len(bar.timeSignature) > 0 else lastTimeSig
	var width = Global.calculateBarWidth(timeSignatureForWidth) * sixteenthNoteWidth
	button.set_custom_minimum_size(Vector2(width, 350))
	button.add_child(barInfoObject)
	return button

func addBar():
	var bar = {
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '',
			'subDivisions': [1, 1, 1, 1]
		}
	song.bars.append(bar)
	var barToAdd = createNewBarButton(bar)
	hBoxContainerNode.add_child(barToAdd)
	hBoxContainerNode.move_child(barToAdd, hBoxContainerNode.get_child_count() - 3)

func renameSection(barIndex, button, markerName):
	song.bars[barIndex].markerName = markerName.text
	button.get_child(0).text = markerName.text
	
func openPopup(bar, button, i):
	var barInfoText = barInfoPopupRef.get_child(0).get_child(3)
	barInfoText.text = bar.markerName
	barInfoPopupRef.get_child(0).popup()
	if barInfoText.is_connected('text_changed', self, 'renameSection') == true:
		barInfoText.disconnect('text_changed', self, 'renameSection')
	barInfoText.connect('text_changed', self, 'renameSection', [i, button, barInfoText])

func _ready():
	titleTextNode.text = song.title
	for i in len(song.bars):
		var button = createNewBarButton(song.bars[i])
		hBoxContainerNode.add_child(button)
	var newBar = newBarNode.instance()
	newBar.connect('pressed', self, 'addBar')
	newBar.set_custom_minimum_size(Vector2(480, 350))
	hBoxContainerNode.add_child(newBar)
	hBoxContainerNode.add_child(fillerBarNode.instance())
	self.add_child(barInfoPopupRef)
	pass


func _on_SongTitle_text_changed():
	song.title = titleTextNode.text
	pass
