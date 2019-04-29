extends CanvasLayer

signal start_game

func update_score(score):
    $ScoreLabel.text = str(score)
	

func update_life(life):
    $LifeLabel.text = str(life)

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func show_game_over():
	show_message("Game Over")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Kill the pests!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()
	
	
func show_level_passed():
	show_message("Level passed!!!")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "New pests coming!"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), 'timeout')
	$StartButton.show()

func _on_Button_pressed():
	$StartButton.hide()
	$MessageLabel.hide()
	emit_signal("start_game")
