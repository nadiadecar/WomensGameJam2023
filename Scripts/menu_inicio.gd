extends Control

@onready var play = $play
@onready var salir = $salir
@onready var creditos = $creditos


func _ready():
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://Escenas/puzzle_entradas.tscn")


func _on_creditos_pressed():
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")


func _on_salir_pressed():
	get_tree().quit()
