extends Marker2D

var entrada = 4

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(200,-150), Vector2(100,-5), Vector2(-35,130), Vector2(-180,-30)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
#	color = [Color.WHITE]
	draw_polygon(puntos, color)
