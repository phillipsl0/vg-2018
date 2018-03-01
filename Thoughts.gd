extends Panel
	
func set_thought(thought):
	$Thought.text = thought

func get_string_location():
	print($Thought.rect_position)
	
func set_location(location):
	rect_position.x = location[0]
	rect_position.y = location[1]