extends Control
@onready var audio_fondo = $audio_fondo

func _ready():
	audio_fondo.play()

func _on_button_pressed():
	get_tree().quit()


func _on_volver_pressed():
	get_tree().change_scene_to_file("res://Escenas/menu_inicio.tscn")
