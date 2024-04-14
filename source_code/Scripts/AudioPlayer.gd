extends Node

func play_bg_music():
	$Background_music.stream_paused = false

func stop_bg_music():
	$Background_music.stream_paused = true

func play_click():
	if Global.is_sound_playing:
		$click.play(0.0)

func play_click_correct():
	if Global.is_sound_playing:
		$click_correct.play(0.0)

func play_click_uncorrect():
	if Global.is_sound_playing:
		$click_uncorrect.play(0.0)

func play_pop_up_window():
	if Global.is_sound_playing:
		$pop_up_window.play(0.0)

func play_pop_down_window():
	if Global.is_sound_playing:
		$pop_down_window.play(0.0)

func is_music_playing():
	if $Background_music.playing:
		return true
	return false
