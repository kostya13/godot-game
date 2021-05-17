extends KinematicBody2D

signal fire


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		$AnimatedSprite.animation = 'front'
		move_and_collide(Vector2(0,2)) 
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.animation = 'back'
		move_and_collide(Vector2(0,-2)) 
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.animation = 'left'
		move_and_collide(Vector2(-2, 0)) 
	elif Input.is_action_pressed("ui_right"):
		$AnimatedSprite.animation = 'right'
		move_and_collide(Vector2(2, 0)) 
	elif Input.is_action_just_pressed("ui_select"):
		emit_signal("fire")
