extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(113,135), Vector2(-113,135), Vector2(-113,-135), Vector2(113,-135)]
	var color = PackedColorArray()
	color = [Color.AZURE]
	draw_polygon(puntos, color )

func seleccionado():
	for child in get_tree().get_nodes_in_group("zonas"):
		child.deseleccionado()
	modulate = Color.ANTIQUE_WHITE

func deseleccionado():
	modulate = Color.CHOCOLATE
