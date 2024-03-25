extends Node

enum Direction { RIGHT, UP, DOWN, LEFT}

var current_direction = Direction.RIGHT

var move_speed = 64
var sprite_size = 64

var body = [{
	"direction": Direction.RIGHT,
	"position": Vector2(1,0)
},
{
	"direction": Direction.RIGHT,
	"position": Vector2(0,0)
}]

func _ready():
	draw_sprites()
	
func _process(delta):
	#move_snake(delta)
	draw_sprites()
	
func move_snake(delta):
	var head = body[0]
	var new_head_pos = head
	
	if Input.is_action_pressed("ui_right") && new_head_pos.direction != Direction.RIGHT:
		new_head_pos.position.x += 1
		new_head_pos.direction = Direction.RIGHT
	elif Input.is_action_pressed("ui_left") && new_head_pos.direction != Direction.LEFT:
		new_head_pos.position.x -= 1
		new_head_pos.direction = Direction.LEFT
	elif Input.is_action_pressed("ui_up") && new_head_pos.direction != Direction.DOWN:
		new_head_pos.position.y -= 1
		new_head_pos.direction = Direction.UP
	elif Input.is_action_pressed("ui_down") && new_head_pos.direction != Direction.UP:
		new_head_pos.position.x += 1
		new_head_pos.direction = Direction.DOWN
		
	body.insert(0, new_head_pos)
	
	if body.size() > 1:
		body.pop_back()

func draw_sprites():
	clear_old_sprites()
	for i in range(body.size()):
		var sprite = Sprite2D.new()
		var part = body[i]
		var texture = load_texture(part, i == 0, i == body.size() - 1)
		sprite.texture = texture
		sprite.scale = Vector2(64.0 / texture.get_width(), 64.0 / texture.get_height())
		sprite.position.x = part.position.x * sprite_size + sprite_size / 2
		sprite.position.y = part.position.y * sprite_size + sprite_size / 2
		add_child(sprite)
		
func load_texture(part, is_head, is_tail):
	if is_head:
		match part.direction:
			Direction.LEFT:
				return load("res://Graphics/head_left.png")
			Direction.RIGHT:
				return load("res://Graphics/head_right.png")
			Direction.UP:
				return load("res://Graphics/head_up.png")
			Direction.DOWN:
				return load("res://Graphics/head_down.png")
	elif is_tail:
		match part.direction:
			Direction.LEFT:
				return load("res://Graphics/tail_right.png")
			Direction.RIGHT:
				return load("res://Graphics/tail_left.png")
			Direction.UP:
				return load("res://Graphics/tail_up.png")
			Direction.DOWN:
				return load("res://Graphics/tail_down.png")

func clear_old_sprites():
	var children = get_children()
	
	for child in children:
		child.queue_free()



