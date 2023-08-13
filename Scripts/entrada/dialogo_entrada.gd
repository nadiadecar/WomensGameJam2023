extends Control


@onready var dialogo1 = $"1"
@onready var dialogo2 = $"2"
@onready var dialogo3 = $"3"
@onready var dialogo4 = $"4"
@onready var dialogo5 = $"5"
@onready var dialogo6 = $"6"

var dialogos

var dialogo_actual = 0

func _ready():
	dialogos = [[dialogo1,dialogo2], [dialogo3], [dialogo4], [dialogo5], [dialogo6]]

func mostrar_dialogo():
	for frase in dialogos[dialogo_actual]:
		frase.visible = true
	dialogo_actual += 1
