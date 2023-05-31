extends Path2D


export (float) var speed = 500

onready var recorridos = get_children()

func _physics_process(delta):
	for recorrido in recorridos:
		recorrido.offset += speed*delta
		
