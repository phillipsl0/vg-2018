extends Panel

var quotes = []
var sources = []
var quote_index = 0

func _ready():
	get_quotes()
	
func get_quotes():
	var dict = {}
	
	var file = File.new()
	file.open("res://json/quotes.json", file.READ)
	var text = file.get_as_text()
	
	dict = parse_json(text)
	file.close()
	dict = dict["quotes"]
	
	for index in dict:
		quotes.append(dict[index]["quote"])
		sources.append(dict[index]["source"])
	

func show_continue_button():
	$ContinueButton.show()

func hide_continue_button():
	$ContinueButton.hide()

func show_quote():
	var quote = quotes[quote_index]
	
	if (quote_index < len(quotes) - 1):
		quote_index += 1
	else: 
		quote_index = 0
	$Quote.text = quote
