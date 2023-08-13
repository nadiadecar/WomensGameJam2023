extends Node2D

@onready var jade = get_tree().get_nodes_in_group("jade")
@onready var noa = get_tree().get_nodes_in_group("noa")
@onready var jade_objetos = get_tree().get_nodes_in_group("jade_objetos")
@onready var noa_objetos = get_tree().get_nodes_in_group("noa_objetos")

var turno = 'jade'

func _ready():
	for child in jade_objetos: 
		child.en_caja.connect(objeto_en_caja)
	for child in noa_objetos: 
		child.en_caja.connect(objeto_en_caja)

func _physics_process(delta):
	if turno == 'jade':
		for child in jade: 
			if not child.is_in_group('zonas'):
				child.seleccionable()
		for child in noa: 
			if not child.is_in_group('zonas'):
				child.no_seleccionable()
	if turno == 'noa':
		for child in jade: 
			if not child.is_in_group('zonas'):
				child.no_seleccionable()
		for child in noa: 
			if not child.is_in_group('zonas'):
				child.seleccionable()

func objeto_en_caja(objeto): 
	print("se ve la señal")
	objeto.visible = false
