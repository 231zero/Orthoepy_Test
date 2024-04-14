extends AudioStreamPlayer2D

func play_sound():
	if Global.is_sound_playing:
		play(0.0)
