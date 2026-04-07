extends Node2D

@export var n : String
@export var col : int
var atlas

func _ready():
	atlas = load("res://assets/sprites/particle.png")
	print("loaded")

func create_child(N,COL,x):
	var spr = Sprite2D.new()
	var ttr = AtlasTexture.new()
	ttr.atlas = atlas
	ttr.region = Rect2(Vector2(6*(N%5),6*((2*col)+(N/5))),Vector2(6,6))
	spr.texture = ttr
	spr.position.x=x
	add_child(spr)

func _process(delta):
	if true:
		if Input.is_action_just_pressed("right"):
			print("d")
			var x=0
			for i in n:
				create_child(int(i),col,x)
				x+=6
				await get_tree().create_timer(0.025).timeout
			await get_tree().create_timer(0.5).timeout
			for i : Sprite2D in get_children():
				for j in 6:
					await get_tree().create_timer(.015).timeout
					i.modulate.a = 1-j/5.0
				i.queue_free()
