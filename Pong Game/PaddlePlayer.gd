extends Area2D

var sprite_size
var screen_size 
var direction = 0
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	handle_input()
	position.x += direction * speed * delta
	
func handle_input():
	if Input.is_action_pressed("ui_left") and collide_left_side():
		direction = -1
	elif Input.is_action_pressed("ui_right") and collide_right_side():
		direction = 1
	else:
		direction = 0

func collide_left_side():
	#Since the sprite is rotated 90 degrees
	return position.x - (sprite_size.y / 2 + 5) > 0
	
func collide_right_side():
	#Since the sprite is rotated 90 degrees
	return position.x + sprite_size.y / 2 + 5 < screen_size.x
