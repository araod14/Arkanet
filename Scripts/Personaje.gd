extends KinematicBody2D


export (int) var velocidad = 600

onready var disparo = preload("res://Scenes/disparo.tscn")
onready var playback = $AnimationTree.get("parameters/playback")

var movimiento = Vector2.ZERO
var cooldown = true

func get_inputs():
	movimiento = Vector2()
	if Input.is_action_pressed("move_rigth"):
		movimiento.x += velocidad
		playback.travel("move_right")
	if Input.is_action_pressed("move_left"):
		movimiento.x -= velocidad
		playback.travel("move_left")
	if Input.is_action_pressed("move_up"):
		movimiento.y -= velocidad
	if Input.is_action_pressed("move_down"):
		movimiento.y += velocidad
	if Input.is_action_pressed("attack"):
		disparar()
	if movimiento == Vector2():
		playback.start("RESET")

func disparar():
	if cooldown:
		cooldown = false
		$Timer.start()
		var instancia_disparo = disparo.instance()
		instancia_disparo.position = $DisparoPos.position
		add_child(instancia_disparo)

func _physics_process(_delta):
	get_inputs()
	movimiento = move_and_slide(movimiento)


func _on_Timer_timeout():
	cooldown = true
	pass # Replace with function body.
