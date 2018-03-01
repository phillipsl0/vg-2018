extends HBoxContainer

var energy
var score
var answer
var answers
var style = StyleBoxFlat.new()

func _ready():
	$ResponseTimer.start()

func set_answer(correct_answer):
	answer = correct_answer

func set_score(score_value):
	score = score_value
	
func set_location(location):
	rect_position.x = location[0]
	rect_position.y = location[1]
	
func set_question(task):
	$Task.text = str(task)
	$Task.set("custom_colors/font_color", Color('#ffffff'))
	
func set_energy(energy_setting):
	energy = energy_setting
		
func set_answers(options):
	answers = options
	
	$Answer.add_item("Choose")
	$Answer.set_item_disabled(0, true)
	
	for item in options:
		$Answer.add_item(item)

func _on_Answer_item_selected( ID ):
	$ResponseTimer.stop()	
	get_parent().change_energy(-1 * energy)
	
	if $Answer.get_item_text(ID) == answers[answer]:
		disable(false)
		get_parent().change_score(score)
		
	else:
		disable(true)
		get_parent().change_score(-1 * score)

func _on_ResponseTimer_timeout():
	get_parent().change_score(-1)
	disable(true)
	
func disable(error):
	$Answer.disabled = true
	$Task.set("custom_colors/font_color", Color('#5c997e'))
	
	if (error):
		style.set_bg_color(Color('#ff0000'))
		#$Answer.set("custom_colors/font_color_disabled", Color('#ff0000'))
	
	else:
		style.set_bg_color(Color('#006600'))
		#$Answer.set("custom_colors/font_color_disabled", Color('#006600'))
	$Answer.set("custom_styles/disabled", style)