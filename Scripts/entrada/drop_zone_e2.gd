extends Marker2D

var entrada = 2

func _draw():
	var puntos = PackedVector2Array()
	puntos = [Vector2(253,-20), Vector2(-230,130), Vector2(-240,90), Vector2(-130,-140)]
	var color = PackedColorArray()
	color = [Color.TRANSPARENT]
#	color = [Color.WHITE]
	draw_polygon(puntos, color)
