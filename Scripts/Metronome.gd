extends Node2D

onready var metronomeTimer = get_node("Timer")

onready var lowClick = get_node("LowClick")
onready var highClick = get_node("HighClick")

var hasStarted = false
var currentBar
var currentBarIndex = 0
var currentBeat = 0
var currentTempoDivider = 1
var lastClick = 0
var clickInterval = 0
var lastTick = OS.get_ticks_msec()

func playAndCount(i):

	if !hasStarted:
		currentBarIndex = i
		currentBar = Global.song.bars[currentBarIndex]
		currentBeat = 0
		currentTempoDivider = currentBar.timeSignature[1] / 4
		hasStarted = true
	clickInterval = 60000 / float(currentBar.tempo) / currentTempoDivider
	if currentBeat == 0:
		highClick.play()
	else:
		lowClick.play()
	print(lastTick)

func _physics_process(delta):
	if currentBarIndex > len(Global.song.bars):
		self.queue_free()
	lastClick = OS.get_ticks_msec() - lastTick
	if lastClick > clickInterval:
		lastTick = OS.get_ticks_msec()
		lastClick = 0
		currentBeat += 1
		if currentBeat == currentBar.timeSignature[0]:
			currentBarIndex += 1
			currentBeat = 0
			currentBar = Global.song.bars[currentBarIndex]
			currentTempoDivider = currentBar.timeSignature[1] / 4
		playAndCount(currentBarIndex)
	pass

func _ready():
	pass


func _on_Timer_timeout():
	pass

func _on_Metronome_tree_exited():
	hasStarted = false
	currentBar = null
	currentBarIndex = 0
	currentBeat = 0
	currentTempoDivider = 1
