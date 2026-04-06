extends CharacterBody2D
const SPEED = 120.0
var current_direction = "none"

func _ready():$AnimatedSprite2D.play("idle_down") 

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(uidelta):
	if Input.is_action_pressed("left"):
		current_direction = "left"
		play_animation(1)
		velocity = Vector2(-SPEED,0)
	elif Input.is_action_pressed("right"):
		current_direction = "right"
		play_animation(1)
		velocity=Vector2(SPEED,0)
	elif Input.is_action_pressed("down"):
		current_direction = "down"
		play_animation(1)
		velocity=Vector2(0,SPEED)
	elif Input.is_action_pressed("up"):
		current_direction = "up"
		play_animation(1)
		velocity=Vector2(0,-SPEED)
	else:
		play_animation(0)
		velocity = Vector2.ZERO
	move_and_slide()

func play_animation(movement):
	$AnimatedSprite2D.play(StringName("%s_%s"%["walk" if movement else "idle",current_direction]))
