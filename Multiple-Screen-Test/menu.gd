extends Control

func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _on_game_screen_pressed():
	get_tree().change_scene_to_file("res://game.tscn")


func _on_quit_pressed():
	get_tree().quit()
