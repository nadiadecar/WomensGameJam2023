extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(293,-10), Vector2(-190,140), Vector2(-200,100), Vector2(-90,-130)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
	draw_polygon(puntos, color)
