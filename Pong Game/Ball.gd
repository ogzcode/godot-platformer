extends Area2D

signal ball_left_screen

var directionList = [
	Vector2(1,1), #Sağ Aşağı
	Vector2(1,-1), #Sağ Yukarı
	Vector2(-1,-1), #Sol Yukarı
	Vector2(-1,1) #Sol Aşağı
]

var speed = 120
var sprite_size
var screen_size
var direction

func _ready():
	sprite_size = $Sprite2D.texture.get_size()
	screen_size = get_viewport_rect().size
	direction = directionList[randi() % directionList.size()]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += direction * speed * delta
	
	collide_screen()
		
func collide_screen():
	if position.x - sprite_size.x / 2 < 0:
		direction.x *= -1
	elif position.x + sprite_size.x / 2 > screen_size.x:
		direction.x *= -1
		
	if position.y - sprite_size.y / 2 < 0:
		direction.y *= -1
		emit_signal("ball_left_screen", "ai")
		reset_ball_pos()
	elif position.y + sprite_size.y / 2 > screen_size.y:
		direction.y *= -1
		emit_signal("ball_left_screen", "user")
		reset_ball_pos()


func _on_paddle_player_area_entered(area):
	direction.y *= -1
	speed += 5


func _on_paddle_ai_area_entered(area):
	direction.y *= -1
	speed += 5
	
func reset_ball_pos():
	position = screen_size / 2
	speed = 100
