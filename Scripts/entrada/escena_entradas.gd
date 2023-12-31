extends Node2D

@onready var entrada_rota = $EntradaRota
@onready var pedazos = get_tree().get_nodes_in_group("pedazo_entrada")
@onready var continuar = $continuar
@onready var dialogo_entrada = $"dialogo-entrada"
@onready var timer = $Timer
@onready var fondo = $Fondo
@onready var click = $click

var pedazos_bien_puestos = 0

func _ready():
	fondo.play()
	timer.timeout.connect(siguiente_nivel)
	for entrada in pedazos: 
		entrada.lugar_correcto.connect(contador)
		entrada.clickeado.connect(clickear)

func contador(entrada):
	pedazos_bien_puestos += 1
	dialogo_entrada.mostrar_dialogo()
	if pedazos_bien_puestos == 5:
		entrada_rota.visible = true
		for pedazo in pedazos:
			pedazo.visible = false
		timer.start(1)
		

func _on_continuar_pressed():
	click.play()
	get_tree().change_scene_to_file("res://Escenas/margarita_celular.tscn")
	
func siguiente_nivel():
	continuar.disabled = false
	continuar.visible = true

func clickear():
	click.play()
