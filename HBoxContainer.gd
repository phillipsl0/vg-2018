extends HBoxContainer

func update_score(score):
	$ScoreLabel.text = str(score)

func update_energy(energy):
	$EnergyLabel.text = str(energy)