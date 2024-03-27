extends Node2D

var AiScore
var PlayerScore
var timer
var goalLabel
var screenSize
var isPaused

func _ready():
	AiScore = $AiScore
	PlayerScore = $PlayerScore
	
	goalLabel = $GoalText
	goalLabel.hide()
	
	timer = $Timer
	timer.connect("timeout", _on_timer_timeout)
	
	screenSize = get_viewport_rect().size


func _process(delta):
	if isPaused:
		$PaddleAi.set_process(false)
		$PaddlePlayer.set_process(false)
		$Ball.set_process(false)
	else:
		if not $PaddleAi.is_processing():
			$PaddleAi.set_process(true)
			$PaddlePlayer.set_process(true)
			$Ball.set_process(true)

func _on_ball_ball_left_screen(value):
	if value == "ai":
		PlayerScore.text = str(int(PlayerScore.text) + 1)
		show_goal_text("player")
	elif value == "user":
		AiScore.text = str(int(AiScore.text) + 1)
		show_goal_text("ai")

func show_goal_text(side):
	if side == "ai":
		goalLabel.position.y = screenSize.y / 2 - 64
	else:
		goalLabel.position.y = screenSize.y / 2 + 64 - goalLabel.size.y / 2
	goalLabel.show()
	isPaused = true
	timer.start()
	
func _on_timer_timeout():
	goalLabel.hide()
	isPaused = false
