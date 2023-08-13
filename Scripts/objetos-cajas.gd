extends Node2D

var seleccionado = false
var espacios
var objeto_en_caja = false

@onready var punto_soltado = global_position

signal en_caja

func _ready(): 
	espacios = get_tree().get_nodes_in_group("zonas")

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		seleccionado = true

func _physics_process(delta):
	if seleccionado: 
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta )
	else:
		global_position = lerp(global_position, punto_soltado, 10*delta)
	
	if abs(global_position - punto_soltado) < Vector2(1,1) and objeto_en_caja: 
		print("alo?")
		emit_signal("en_caja", self)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed: 
			seleccionado = false 
			var minima_distancia = 100
			for child in espacios: 
				if (child.is_in_group('jade') and self.is_in_group('jade')) or (child.is_in_group('noa') and self.is_in_group('noa')) :
					var distancia = global_position.distance_to(child.global_position)
					if distancia < minima_distancia:
						punto_soltado = child.global_position
						objeto_en_caja = true


func no_seleccionable():
	modulate = Color.WEB_GRAY

func seleccionable():
	modulate = Color.WHITE
