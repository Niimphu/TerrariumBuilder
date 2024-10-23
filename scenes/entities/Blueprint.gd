extends Node2D

func _on_area_2d_mouse_entered():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(5, 5), 0.15)


func _on_area_2d_mouse_exited():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.15)
