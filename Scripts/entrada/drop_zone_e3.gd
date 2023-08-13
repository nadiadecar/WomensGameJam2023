extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(20,-80), Vector2(170,90), Vector2(-90,40), Vector2(-90,-50)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
	draw_polygon(puntos, color)
