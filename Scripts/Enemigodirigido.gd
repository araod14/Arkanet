extends Area2D


export (int) var speed = 200

onready var personaje = get_tree().get_nodes_in_group("personaje") 


func _physics_process(delta):
	var posicion_personaje = personaje[0].global_position
	global_position = global_position.move_toward(posicion_personaje ,speed*delta)
