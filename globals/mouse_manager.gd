extends Node2D

var current_piece: Piece

func _ready():
	EventBus.connect("_piece_clicked", grab_piece)

func _physics_process(_delta):
	if !current_piece:
		return
	current_piece.global_position = get_global_mouse_position() - Vector2(current_piece.centre)
	if Input.is_action_just_released("click"):
		EventBus.emit_signal("_piece_released")
		current_piece = null

func grab_piece(clicked_piece: Piece) -> void:
	if !current_piece:
		current_piece = clicked_piece
