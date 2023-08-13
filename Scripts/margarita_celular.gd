extends Node2D

@onready var continuar = $continuar

func _ready():
	continuar.disabled = false
	continuar.visible = true

func _on_continuar_pressed():
	get_tree().change_scene_to_file("res://Escenas/cosas_cajas.tscn")
