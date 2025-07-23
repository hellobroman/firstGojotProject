extends Node2D
var delta = 1
const SPEED = 200
func _draw():
	draw_circle(Vector2(100, 100), 50, Color.RED)
	draw_rect(Rect2(150, 50, 100, 100), Color.BLUE)
	draw_line(Vector2(50, 200), Vector2(200, 200), Color.GREEN, 3)
func _process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	direction = direction.normalized()
	position += direction * SPEED * delta
