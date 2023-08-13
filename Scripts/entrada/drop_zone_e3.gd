extends Marker2D

var entrada = 3

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(-10,-90), Vector2(140,80), Vector2(-120,30), Vector2(-120,-60)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
#	color = [Color.WHITE]
	draw_polygon(puntos, color)
