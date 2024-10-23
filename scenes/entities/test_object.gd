extends CharacterBody2D

var draggable := false
var falling := false
var fall_speed := 2


@onready var initial_pos = global_position

func _ready():
	velocity.y = fall_speed
	$Area2D.connect("mouse_entered", mouse_entered)
	$Area2D.connect("mouse_exited", mouse_exited)
	$CollisionPolygon2D.disabled = true
	

func _physics_process(_delta):
	if falling:
		if move_and_collide(velocity):
			falling = false
		return
	
	if !draggable:
		return
	
	if Input.is_action_just_pressed("click"):
		Global.dragging = true
	if Input.is_action_pressed("click"):
		global_position = get_global_mouse_position()
		if Global.snapping:
			global_position = Global.snap_pos
	elif Input.is_action_just_released("click"):
		Global.dragging = false
		draggable = false
		if not Global.snapping:
			var tween = get_tree().create_tween()
			tween.tween_property(self, "global_position", initial_pos, 0.2).set_ease(Tween.EASE_IN_OUT)
		else:
			$Area2D.queue_free()
			falling = true
			$CollisionPolygon2D.disabled = false

func mouse_entered():
	if not Global.dragging:
		draggable = true

func mouse_exited():
	if not Input.is_action_pressed("click"):
		draggable = false
