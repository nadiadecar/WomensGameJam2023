extends Node2D

var seleccionado = false
var espacios
@onready var punto_soltado = global_position

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

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed: 
			seleccionado = false 
			var minima_distancia = 75
			for child in espacios: 
				var distancia = global_position.distance_to(child.global_position)
				if distancia < minima_distancia:
					child.seleccionado()
					punto_soltado = child.global_position
					minima_distancia = distancia
				
			
