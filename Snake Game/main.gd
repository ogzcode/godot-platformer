extends Node2D

func _ready():
	create_background()
	
func create_background():
	var grid_size = 10
	var square_size = 64
	var colors = ["#34d399", "#10b981"]
	var color_index = 0
	
	for x in range(grid_size):
		for y in range(grid_size):
			var color_rect = ColorRect.new()
			color_rect.color = Color(colors[(x + y) % 2])
			color_index += 1
			color_rect.size = Vector2(square_size, square_size)
			add_child(color_rect)
			color_rect.position = Vector2(y * square_size, x * square_size)
