extends Area2D

signal hit

var direction = null

# warning-ignore:unused_argument
func _process(delta):
	if direction:
		position += direction


func _on_Area2D_body_entered(body):
	if body.is_in_group("wall"):
		queue_free()
	elif body.is_in_group("enemy"):
		emit_signal("hit")
		body.queue_free()
		queue_free()
