extends Area2D

var sprite_size
var screen_size 
var speed = 100
var ball

func _ready():
	sprite_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size
	ball = get_node("../Ball")

func _process(delta):
	var ballX = ball.position.x
	var newPosition = clamp(ballX, sprite_size.y / 2, screen_size.x - sprite_size.y / 2)
	var distanceToTarget = float(newPosition - position.x)
	var movement = sign(distanceToTarget) * min(abs(distanceToTarget), speed * delta)
	position.x += movement
	
