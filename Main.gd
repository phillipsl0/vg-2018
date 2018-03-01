extends Node
export (PackedScene) var Mob

var energy
var score

var scene

func _ready():
	randomize()
	
func new_game():
	energy = 50
	score = 0
	scene = 0
	
	interlude()
	begin_round()

func begin_round():
	# test
	$Scenes.show_scene(scene)
	
	$HUD.show_message("Get Ready")
	
	$ThoughtTimer.start()
	$IncreaseSpeedTimer.start()
	$SceneTimer.start()
	$QuestionTimer.start()
	
func game_over():
    $ScoreTimer.stop()
    $MobTimer.stop()
    $HUD.show_game_over()
	
func _on_StartTimer_timeout():
    $MobTimer.start()
    $ScoreTimer.start()

func _on_ThoughtTimer_timeout():
	$HUD.get_thought()

func _on_IncreaseSpeedTimer_timeout():
	if scene == 0:
		change_speed_work()
	elif scene == 1:
		change_speed_lunch()
	else:
		change_speed_home()

func change_speed_work():
	if ($ThoughtTimer.wait_time <= 0.7):
		$ThoughtTimer.wait_time = 0.07
	else:
		$ThoughtTimer.wait_time -= 0.1
		
func change_speed_lunch():
	if ($ThoughtTimer.wait_time <= 0.4):
		$ThoughtTimer.wait_time = 0.4
	else:
		$ThoughtTimer.wait_time -= 0.1
		
func change_speed_home():
	if ($ThoughtTimer.wait_time <= 0.1):
		$ThoughtTimer.wait_time = 0.1
	else:
		$ThoughtTimer.wait_time -= 0.1

func switch_scene():
	if scene < 2:
		scene += 1

	else:
		scene = 0
		
func interlude():
	$HUD.show_quotes()

func clean_up():
	$IncreaseSpeedTimer.stop()
	$ThoughtTimer.stop()
	$QuestionTimer.stop()
	$HUD.clear_thoughts()
	$HUD.clear_questions()
	
func _on_SceneTimer_timeout():
	clean_up()
	check_score()
	switch_scene()
	interlude()

func _on_QuestionTimer_timeout():
	$HUD.get_question()
	pass # replace with function body

func update_score(points):
	score += points
	$HUD.update_score(score)

func check_score():
	if (score < 15):
		pass
		#$HUD.show_failure()
		
func update_energy(points):
	energy += points
	$HUD.update_energy(energy)
	
	if (energy <= 0):
		pass