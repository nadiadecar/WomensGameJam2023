extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(200,-140), Vector2(110,5), Vector2(-10,150), Vector2(-170,-20)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
	draw_polygon(puntos, color)
