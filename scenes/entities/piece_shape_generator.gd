@tool
extends Area2D

@onready var sprite := $Sprite2D

func update_shape() -> void:
	var collider := get_node_or_null("CollisionPolygon2D")
	if collider:
		collider.queue_free()
	if !sprite.texture:
		return
	print_debug("New Sprite2D texture yippie")
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(sprite.texture.get_image())

	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, sprite.texture.get_size()))
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		add_child(collision_polygon)
		collision_polygon.set_name("CollisionPolygon2D")
		collision_polygon.set_owner(get_parent())
		

		if sprite.centered:
			collision_polygon.position -= bitmap.get_size()/2
