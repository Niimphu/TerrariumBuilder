extends Node

var dragging := false
var snapping := false
var snap_pos := Vector2.ZERO
var slots: Array

func _process(_delta):
	if Input.is_action_just_pressed("click"):
		dragging = false
		snapping = false
	if slots.is_empty():
		snapping = false
	else:
		snapping = true
		snap_pos = slots.back().global_position
