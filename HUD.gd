extends CanvasLayer

signal start_game
signal begin_round

func show_game_over():
    $Normal.show_message("Game Over")
    yield($MessageTimer, "timeout")
    $Normal.show_start_button()
    $Normal.show_message("The Mental Load")

func show_message(message):
	$Normal.show_message(message)
	$MessageTimer.start()
	
func get_question():
	$Normal.get_question()
	
func clear_questions():
	$Normal.clear_questions()
		
func get_thought():
	$Normal.get_thought()

func clear_thoughts():
	$Normal.clear_thoughts()
	
func show_continue():
	$Normal.show_continue_button()

func _on_StartButton_pressed():
    $Normal.hide_start_button()
    emit_signal("start_game")

func _on_MessageTimer_timeout():
    $Normal.hide_message()
		
func _on_ContinueButton_pressed():
	$Quotes.hide_continue_button()
	$Quotes.hide()
	$Normal.show()
	emit_signal("begin_round")

func _on_QuoteTimer_timeout():
	$Quotes.show_continue_button()

func show_quotes():
	$Normal.hide()
	$Quotes.show_quote()
	$Quotes.show()
	$QuoteTimer.start()

# from parent down
func update_score(score):
	$Normal.update_score(score)

# from parent down
func update_energy(energy):
	$Normal.update_energy(energy)

# from child up
func change_energy(energy):
	get_parent().update_energy(energy)

# from child up
func change_score(score):
	get_parent().update_score(score)