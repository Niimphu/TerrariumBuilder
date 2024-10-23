extends Node2D

class_name Piece

@onready var collider := $CollisionPolygon2D
@onready var mouse_zone := $MouseOverZone
@onready var mouse_zone_collider := $MouseOverZone/CollisionPolygon2D
@onready var initial_pos = global_position

var hovering := false
var placed := false

func _ready():
	mouse_zone_collider.polygon = collider.polygon
	mouse_zone_collider.position = collider.position
	mouse_zone_collider.scale = collider.scale
	
	
	mouse_zone.connect("mouse_entered", mouse_entered)
	mouse_zone.connect("mouse_exited", mouse_exited)
	EventBus.connect("_piece_released", mouse_depressed)
	collider.disabled = true


func _process(_delta):
	#bla bla
	if hovering and Input.is_action_just_pressed("click"):
		if EventBus.get_signal_connection_list("_piece_clicked").is_empty():
			print_debug("Signal not connected. Is MouseManager instanced in parent scene??")
		EventBus.emit_signal("_piece_clicked", self)


func mouse_depressed() -> void:
	if not placed:
		reset_pos()


func reset_pos() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "global_position", initial_pos, 0.25).set_ease(Tween.EASE_IN_OUT)


func mouse_entered() -> void:
	hovering = true


func mouse_exited() -> void:
	hovering = false
