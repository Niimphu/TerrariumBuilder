extends Node2D

@onready var play_area: TileMapLayer = $PlayArea
@onready var drop_area: TileMapLayer = $DropArea


func _ready():
	var cells = drop_area.get_used_cells()
	var left_boundary := 1000
	var right_boundary := 0
	for cell in cells:
		if cell.x < left_boundary:
			left_boundary = cell.x
		if cell.x > right_boundary:
			right_boundary = cell.x
	
