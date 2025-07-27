extends CharacterBody2D
var bounds = Rect2(-50, -50, 951, 497)  # x, y, width, height (screen or level area)
const SPEED = 200
var facing = Vector2.RIGHT  # Default direction
func _draw():
	draw_circle(Vector2(100, 100), 50, Color.RED)
	draw_rect(Rect2(150, 50, 100, 100), Color.BLUE)
	draw_line(Vector2(50, 200), Vector2(200, 200), Color.GREEN, 3)
func _physics_process(delta):
	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	if input_vector != Vector2.ZERO:
		facing = input_vector

	velocity = input_vector * SPEED
	move_and_slide()

	# After movement, clamp position
	position.x = clamp(position.x, bounds.position.x, bounds.position.x + bounds.size.x)
	position.y = clamp(position.y, bounds.position.y, bounds.position.y + bounds.size.y)
	
	update_hitbox_position()
	
func update_hitbox_position():
	var offset_distance = 30
	$Hitbox.position = facing.normalized() * offset_distance
	$Hitbox.rotation = facing.angle()
