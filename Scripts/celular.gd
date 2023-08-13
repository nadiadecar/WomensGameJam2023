extends Node2D

@onready var dialogo_1 = $Dialogo1
@onready var dialogo_2 = $Dialogo2
@onready var dialogo_3 = $Dialogo3
@onready var dialogo_4 = $Dialogo4
@onready var dialogo_5 = $Dialogo5
@onready var dialogo_6 = $Dialogo6

var dialogos 
var dialogo_actual = 0 

func _ready():
	dialogos = [dialogo_1, dialogo_2, dialogo_3, dialogo_4, dialogo_5, dialogo_6]

func siguiente_dialogo():
	dialogos[dialogo_actual].visible = true
	dialogo_actual += 1
