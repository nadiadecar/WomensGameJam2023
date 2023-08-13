extends Node2D

@onready var continuar = $continuar
@onready var petalos = get_tree().get_nodes_in_group("petalo")
@onready var celular = $celular
@onready var timer = $Timer

var cantidad_petalos_caidos = 0

func _ready():
	timer.timeout.connect(continuar_juego)
	for petalo in petalos: 
		petalo.quita_petalo.connect(avanzar)

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://Escenas/cosas_cajas.tscn")

func avanzar():
	celular.siguiente_dialogo()
	cantidad_petalos_caidos += 1 
	if cantidad_petalos_caidos == 6: 
		timer.start(1)

func continuar_juego():
	continuar.disabled = false
	continuar.visible = true
