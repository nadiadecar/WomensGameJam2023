extends Node2D

@onready var texto_noa = $TextoNoa
@onready var texto_jade = $TextoJade
@onready var jade = get_tree().get_nodes_in_group("jade")
@onready var noa = get_tree().get_nodes_in_group("noa")
@onready var jade_objetos = get_tree().get_nodes_in_group("jade_objetos")
@onready var noa_objetos = get_tree().get_nodes_in_group("noa_objetos")
@onready var burbuja_jade = $BurbujaJade
@onready var burbuja_noa = $BurbujaNoa
@onready var timer = $Timer
@onready var continuar = $continuar

var turnos = {"jade": "noa", "noa": "jade"}
var turno = 'jade'
var cant_objetos = 0

const dialogos = {"totoro": ["Fija que se lleva su peluche de Totoro. Nunca duerme sin él.", "noa"], \
			"afiche": ["Si lleva su poster de Star Wars va a descascarar las paredes.", "jade"], \
			"libros" : ["Ojalá llegue pronto la biblioteca que pedimos para esos libros porque sino va a hacer berrinches.", "noa"],\
			"acuarelas" : ["Espero que tenga cuidado para no manchar todo con las acuarelas.", "jade"], \
			"baquetas" : ["No sé dónde va a meter la batería. Y espero que no nos de problema con los vecinos.", "noa"],\
			"planta" : ["Si lleva las plantas que tenga cuidado para regarlas porque deja hecho un enchastre", "jade"]}

func _ready():
	timer.timeout.connect(continuar_juego)
	for child in jade_objetos: 
		child.en_caja.connect(objeto_en_caja_funcion)
	for child in noa_objetos: 
		child.en_caja.connect(objeto_en_caja_funcion)
	cambiar_colores()

func _physics_process(delta):
	pass

func objeto_en_caja_funcion(objeto): 
	cant_objetos += 1
	var datos_dialogo = dialogos[objeto.tipo]
	if datos_dialogo[1] == 'noa':
		burbuja_jade.visible = false
		burbuja_noa.visible = true
		texto_jade.text = ""
		texto_noa.text = datos_dialogo[0]
	if datos_dialogo[1] == 'jade':
		burbuja_noa.visible = false
		burbuja_jade.visible = true
		texto_noa.text = ""
		texto_jade.text = datos_dialogo[0]
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
	if cant_objetos == 6: 
		timer.start(1.5)
		

func continuar_juego():
	jade = get_tree().get_nodes_in_group("jade")
	noa = get_tree().get_nodes_in_group("noa")
	for child in jade: 
		if not child.is_in_group('zonas'):
			child.no_seleccionable()
	for child in noa: 
		if not child.is_in_group('zonas'):
			child.no_seleccionable()
	burbuja_jade.visible = false
	burbuja_noa.visible = false
	texto_jade.text = ""
	texto_noa.text = ""
	continuar.visible = true
	continuar.disabled = false

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")
