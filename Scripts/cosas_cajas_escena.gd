extends Node2D

@onready var jade = get_tree().get_nodes_in_group("jade")
@onready var noa = get_tree().get_nodes_in_group("noa")
@onready var jade_objetos = get_tree().get_nodes_in_group("jade_objetos")
@onready var noa_objetos = get_tree().get_nodes_in_group("noa_objetos")

var turnos = {"jade": "noa", "noa": "jade"}
var turno = 'jade'

func _ready():
	for child in jade_objetos: 
		child.en_caja.connect(objeto_en_caja_funcion)
	for child in noa_objetos: 
		child.en_caja.connect(objeto_en_caja_funcion)
	cambiar_colores()

func _physics_process(delta):
	pass

func objeto_en_caja_funcion(objeto): 
	print(objeto.tipo)
	objeto.queue_free()
	cambiar_colores()

func cambiar_colores():
	turno = turnos[turno]
	jade = get_tree().get_nodes_in_group("jade")
	noa = get_tree().get_nodes_in_group("noa")
	
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
	
