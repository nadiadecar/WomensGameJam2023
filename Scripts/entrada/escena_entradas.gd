extends Node2D

@onready var entrada_rota = $EntradaRota
@onready var pedazos = get_tree().get_nodes_in_group("pedazo_entrada")
@onready var continuar = $continuar


var pedazos_bien_puestos = 0

func _ready():
	for entrada in pedazos: 
		entrada.lugar_correcto.connect(contador)


func contador(entrada):
	pedazos_bien_puestos += 1
	if pedazos_bien_puestos == 5:
		entrada_rota.visible = true
		for pedazo in pedazos:
			pedazo.visible = false
		
		continuar.disabled = false
		continuar.visible = true


func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://Escenas/margarita_celular.tscn")
