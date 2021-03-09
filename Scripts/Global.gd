extends Node


var song = {
	'title': 'Asleep at the wheel',
	'associatedPlaylists': [],
	'bars': [
		{
			'markerName': 'Intro',
			'color': '#27c235',
			'timeSignature': [4, 4],
			'tempo': '100',
			'subDivisions': [1, 1, 1, 1]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '100',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': 'Verse',
			'color': '#302790',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '200',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '200',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': 'Chorus',
			'color': '#c7b416',
			'timeSignature': [5, 8],
			'tempo': '100',
			'subDivisions': [3, 2]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [5, 8],
			'tempo': '100',
			'subDivisions': [3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': 'Verse',
			'color': '#302790',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '200',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [4, 4],
			'tempo': '200',
			'subDivisions': [1, 1, 1, 1]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '200',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': 'Chorus',
			'color': '#c7b416',
			'timeSignature': [5, 8],
			'tempo': '100',
			'subDivisions': [3, 2]
		},
				{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [5, 8],
			'tempo': '100',
			'subDivisions': [3, 2]
		},
		{
			'markerName': '',
			'color': '',
			'timeSignature': [7, 8],
			'tempo': '100',
			'subDivisions': [3, 3, 2]
		},
	]
}

func setColorAndRadius(elem, colorFromProps):
	var style = StyleBoxFlat.new()
	var color = Color(colorFromProps)
	style.set_corner_radius_all(30)
	style.set_bg_color(color)
	elem.set("custom_styles/normal", style)
	
	var _hoverStyle = StyleBoxFlat.new()
	var _hoverColor = Color(colorFromProps)
	elem.set("custom_styles/hover", style)
	_hoverStyle.set_corner_radius_all(30)
	_hoverStyle.set_bg_color(colorFromProps)

func calculateBarWidth(timeSig):
	var denominator = 16 / timeSig[1]
	return denominator * timeSig[0]
