extends ItemList

# class member variables go here, for example:
# var a = 2
var selectedItems = ["textvar", "secondtextvar"]
var unselectedItems = ["not", "Selected"]

func _ready():
	for i in range(len(selectedItems)):
		add_item(selectedItems[i])
	for i in range(len(unselectedItems)):
		add_item(unselectedItems[i])
	
	select(0)
	set_item_disabled(0, true)
	select(1)
	set_item_disabled(1, true)
		
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
