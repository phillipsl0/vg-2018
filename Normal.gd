extends Panel
var Thoughts = preload("res://Thoughts.tscn")
var Questions = preload("res://Questions.tscn")

var possible_thoughts = []
var sectors = []

var possible_questions = []
var answers = []
var correct = []
var energy_cost = []
var scores = []

var sector = 0
var screensize

func _ready():
	screensize = get_viewport_rect().size
	get_all_data()
	
func get_all_data():
	var dict = {}
	var file = File.new()
	file.open("res://json/data.json", file.READ)
	var text = file.get_as_text()
	
	dict = parse_json(text)
	file.close()
	dict = dict["data"]
	
	var questions = dict["questions"]
	var thoughts = dict["thoughts"]
	
	for question in questions:
		possible_questions.append(questions[question]["text"])
		answers.append(questions[question]["answers"])
		correct.append(questions[question]["correct"])
		energy_cost.append(questions[question]["energy"])
		scores.append(questions[question]["score"])
	
	for thought in thoughts:
		possible_thoughts.append(thoughts[thought]["text"])
		sectors.append(thoughts[thought]["sector"])
	
func get_random_number():
	randomize()
	return randi()%1000 

func get_sector_min_x(sector):
	var x = screensize.x/3
	
	if (sector == 0):
		return 0 - 10
	elif (sector == 1):
		return x + 1
	else:
		return 2 * x + 1
			
func get_sector_max_x(sector):
	var x = screensize.x/3
	
	if (sector == 0):
		return x
	elif (sector == 1):
		return 2 * x
	else:
		return 3 * x
		
func set_location(sector):
	var x = -500
	var y = -500

	while (x > get_sector_max_x(sector) or x < get_sector_min_x(sector)):
		x = get_random_number()
		
	while (y > (screensize.y - 65) or  y < (0 - 10)):
		y = get_random_number()
	
	return [x, y]
	
func get_index(length):
	randomize()
	return randi()%length
	
func get_sector():
	randomize()
	return randi()%3
	
func get_thought():
	var thought = Thoughts.instance()
	add_child(thought)
	thought.add_to_group("thoughts")
	var current_index = get_index(len(possible_thoughts))
	
	thought.set_thought(possible_thoughts[current_index])
	
	var sector = get_sector()
	var location = set_location(sector)
	thought.set_location(location) 

	thought.show()

func clear_thoughts():
	var thoughts = get_tree().get_nodes_in_group("thoughts")
	
	for thought in thoughts:
		thought.queue_free()
	
func get_question():
	var question = Questions.instance()
	add_child(question)
	question.add_to_group("questions")
	var current_index = get_index(len(possible_questions))
	
	question.set_question(possible_questions[current_index])
	question.set_answers(answers[current_index])
	question.set_answer(correct[current_index])
	question.set_energy(energy_cost[current_index])
	question.set_score(scores[current_index])
	
	var sector = get_sector()
	var location = set_location(sector)
	question.set_location(location) 

	question.show()
	
func clear_questions():
	var questions = get_tree().get_nodes_in_group("questions")
	
	for question in questions:
		question.queue_free()
		
func show_start_button():
	$StartButton.show()
	
func hide_start_button():
	$StartButton.hide()

func show_message(text):
    hide_message()
    $MessageLabel.text = text
    $MessageLabel.show()

func hide_message():
	$MessageLabel.hide()

func update_score(score):
	$Stats.update_score(score)

func update_energy(energy):
	$Stats.update_energy(energy)

func change_energy(energy):
	get_parent().change_energy(energy)

func change_score(score):
	get_parent().change_score(score)