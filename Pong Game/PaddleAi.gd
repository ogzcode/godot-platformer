extends Area2D

var sprite_size
var screen_size 
var direction = 0
var speed = 90
var ball

func _ready():
	sprite_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size
	position.y = sprite_size.y / 2
	position.x = screen_size.x / 2
	ball = get_node("../Ball")

func _process(delta):
	var ballX = ball.position.x
	var newPosition = clamp(ballX, sprite_size.x / 2, screen_size.x - sprite_size.x / 2)
	position.x = newPosition
	
	
