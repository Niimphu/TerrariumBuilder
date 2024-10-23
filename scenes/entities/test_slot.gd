extends StaticBody2D

func _ready():
	input_pickable = true
	connect("mouse_entered", snap)
	connect("mouse_exited", unsnap)

func snap():
	Global.slots.append(self)

func unsnap():
	Global.slots.erase(self)
