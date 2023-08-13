extends Node2D

@onready var continuar = $continuar
@onready var petalos = get_tree().get_nodes_in_group("petalo")
@onready var celular = $celular

var cantidad_petalos_caidos = 0

func _ready():
	for petalo in petalos: 
		petalo.quita_petalo.connect(avanzar)

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://Escenas/cosas_cajas.tscn")

func avanzar():
	celular.siguiente_dialogo()
	cantidad_petalos_caidos += 1 
	if cantidad_petalos_caidos == 6: 
		continuar.disabled = false
		continuar.visible = true
