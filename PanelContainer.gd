extends PanelContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var HER = 1

func set_task(task):
	$Task.text = str(task)
	
func set_energy(energy):
	$EnergyCost.text = str(energy)

func set_option_availability(is_disabled):
	$PlayerAssigned.set_item_disabled(is_disabled)
	
	if (is_disabled):
		$PlayerAssigned.select(HER)
		


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
