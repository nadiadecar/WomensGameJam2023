extends Control

@onready var play = $play
@onready var salir = $salir
@onready var creditos = $creditos
@onready var audio_fondo = $audio_fondo
@onready var click = $click

func _ready():
	audio_fondo.play()


func _on_play_pressed():
	click.play()
	get_tree().change_scene_to_file("res://Escenas/puzzle_entradas.tscn")


func _on_creditos_pressed():
	click.play()
	get_tree().change_scene_to_file("res://Escenas/creditos.tscn")


func _on_salir_pressed():
	click.play()
	get_tree().quit()
