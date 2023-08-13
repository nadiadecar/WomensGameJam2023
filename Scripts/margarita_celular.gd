extends Node2D

@onready var continuar = $continuar
@onready var petalos = get_tree().get_nodes_in_group("petalo")
@onready var celular = $celular
@onready var timer = $Timer
@onready var audio_fondo = $audio_fondo
@onready var click = $click

var cantidad_petalos_caidos = 0

func _ready():
	audio_fondo.play()
	timer.timeout.connect(continuar_juego)
	for petalo in petalos: 
		petalo.quita_petalo.connect(avanzar)
		petalo.clickeado.connect(clickear)

func _on_continuar_pressed():
	click.play()
	get_tree().change_scene_to_file("res://Escenas/cosas_cajas.tscn")

func avanzar():
	celular.siguiente_dialogo()
	cantidad_petalos_caidos += 1 
	if cantidad_petalos_caidos == 6: 
		timer.start(1)

func continuar_juego():
	continuar.disabled = false
	continuar.visible = true

func clickear():
	click.play()
