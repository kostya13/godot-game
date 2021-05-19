extends Node2D

export(PackedScene) var bullet_scene
export(PackedScene) var enemy_scene

const speed = 10
var score = 0

var fire_direction = {'front':  Vector2(0,speed),
					  'back': Vector2(0,-speed),
					  'left': Vector2(-speed, 0),
					  'right': Vector2(speed ,0)}

# Called when the node enters the scene tree for the first time.
func _ready():
	$Level1.visible = false
	$Player.visible = false
	$Control.visible = true
	$Score.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Control_game_start():
	$Level1.visible = true
	$Player.visible = true
	$Control.visible = false
	$Score.visible = true
	make_enemy()


func make_enemy():
	var rng = RandomNumberGenerator.new()
	rng.randomize()	
	while true:
		var x = rng.randi_range(2, 14)
		var y = rng.randi_range(2, 8)
		var tile_size = 64
		var half = tile_size / 2
		var enemy = enemy_scene.instance()		
		enemy.position = Vector2(x * tile_size - half ,y * tile_size - half)
		if not enemy.test_move(Transform2D (0, enemy.position), Vector2(0,0)):
			add_child(enemy)
			break
		else:
			enemy.queue_free()


func _on_KinematicBody2D_fire():
	var bullet = bullet_scene.instance()
	add_child(bullet)
	bullet.connect("hit", self, "on_hit")
	bullet.position = $Player.position
	bullet.direction = fire_direction[$Player/AnimatedSprite.animation]


func on_hit():
	print("hit")
	score += 1
	$Score/Label2.text = str(score)
	make_enemy()
