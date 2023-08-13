extends Node2D


var seleccionado = false
var cae = false
signal quita_petalo

func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		seleccionado = true


func _physics_process(delta):
	if seleccionado: 
		global_position = lerp(global_position, get_global_mouse_position(), 25*delta )
	if cae:
		global_position = lerp(global_position, Vector2(global_position.x, 900), 3*delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed and seleccionado: 
			seleccionado = false 
			cae = true
			emit_signal("quita_petalo")
				
			
