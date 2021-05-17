extends Node2D

export(PackedScene) var bullet_scene

var fire_direction = {'front':  Vector2(0,100),
					  'back': Vector2(0,-100),
					  'left': Vector2(-100, 0),
					  'right': Vector2(100 ,0)}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Level1.visible = false
	$Control.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_game_start():
	$Level1.visible = true
	$Control.visible = false


func _on_KinematicBody2D_fire():
	var bullet = bullet_scene.instance()
	#connect("body_entered", bullet, "_on_Bullet_Collide")
	add_child(bullet)
	bullet.position = $KinematicBody2D.position
	bullet.direction = fire_direction[$KinematicBody2D/AnimatedSprite.animation]
	
	


func _on_Bullet_Collide(node):
	print('ok')
