extends Button

func start_animation():
	$AnimationPlayer.play("popup")

func end_animation():
	$AnimationPlayer.play_backwards("popup")
