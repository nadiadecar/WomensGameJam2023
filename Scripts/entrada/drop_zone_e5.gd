extends Marker2D

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(100,-30), Vector2(50,100), Vector2(-70,130), Vector2(-180,80), Vector2(50,-200)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
	draw_polygon(puntos, color)
