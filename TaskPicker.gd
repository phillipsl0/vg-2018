extends VBoxContainer
#export (PackedScene) var TaskAssigned
# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var itemsGeneral = ["textvar", "secondtextvar", "general items are here for both characters"]
var itemsSpecific = ["these", "are", "very specific items only for her"]
var energyCosts = [5, 3, 7, 9, 6, 2]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	for i in range(len(itemsSpecific)):
		var color = '#cccccc'
		var item = TaskAssigned.instance()
		
		item.set_task(itemsSpecific[i], color)
		item.set_energy(energyCosts[i], color)
		item.set_option_unavailability(true)
		
		add_child(item)
		
	var offset = len(itemsSpecific)
	for i in range(len(itemsGeneral)):
		var color = '#ffffff'
		var item = TaskAssigned.instance()
		
		item.set_task(itemsGeneral[i], color)
		item.set_energy(energyCosts[i+offset], color)
		item.set_option_unavailability(false)
		
		add_child(item)

