extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(123,-160), Vector2(-20,180), Vector2(-90,-90)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
#	color = [Color.ANTIQUE_WHITE]
	draw_polygon(puntos, color)
