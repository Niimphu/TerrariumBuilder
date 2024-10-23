extends Node2D

var current_piece: Piece

func _ready():
	EventBus.connect("_piece_clicked", grab_piece)

func _physics_process(_delta):
	if !current_piece:
		return
	current_piece.global_position = get_global_mouse_position()
	if Input.is_action_just_released("click"):
		EventBus.emit_signal("_piece_released")
		current_piece = null

func grab_piece(clicked_piece: Piece) -> void:
	print("bash")
	if !current_piece:
		print("bosh")
		current_piece = clicked_piece
