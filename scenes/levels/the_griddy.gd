extends Node2D

@onready var play_area: TileMapLayer = $PlayArea

func _ready():
	var cells = play_area.get_used_cells()
	var left_boundary := 1000
	var right_boundary := 0
	for cell in cells:
		if cell.x < left_boundary:
			left_boundary = cell.x
		if cell.x > right_boundary:
			right_boundary = cell.x
	
