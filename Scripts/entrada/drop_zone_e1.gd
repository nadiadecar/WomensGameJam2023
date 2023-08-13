extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(123,-110), Vector2(-20,220), Vector2(-90,-50)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
	draw_polygon(puntos, color)
