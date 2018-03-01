extends CanvasLayer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
func show_scene(scene):
	if scene == 0:
		$Work.show()
		$Lunch.hide()
		$Home.hide()

	elif scene == 1:
		$Lunch.show()
		$Work.hide()
		$Home.hide()

	else:
		$Home.show()
		$Work.hide()
		$Lunch.hide()


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
