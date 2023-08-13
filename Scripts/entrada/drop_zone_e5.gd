extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(140,-10), Vector2(90,130), Vector2(-30,150), Vector2(-140,100), Vector2(90,-180)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
#	color = [Color.WHITE]
	draw_polygon(puntos, color)
