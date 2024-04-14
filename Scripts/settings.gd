extends Control


func _ready():
	if Global.is_sound_playing:
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_on/AnimationPlayer.play("RESET")
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_off/AnimationPlayer.play("RESET_2")
	else:
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_on/AnimationPlayer.play("RESET_2")
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_off/AnimationPlayer.play("RESET")
	
	if Global.is_music_playing:
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_on/AnimationPlayer.play("RESET")
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_off/AnimationPlayer.play("RESET_2")
	else:
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_on/AnimationPlayer.play("RESET_2")
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_off/AnimationPlayer.play("RESET")

func _on_close_pressed():
	disable_buttons(true)
	get_parent().get_parent().disable_buttons(false)
	Audio.play_click()
	if Global.active_window == 'settings':
		Audio.play_pop_down_window()
		$AnimationPlayer.play_backwards('popup')
		Global.active_window = 'menu'
	if Global.active_window == 'settings_test':
		Audio.play_pop_down_window()
		$AnimationPlayer.play_backwards('popup')
		Global.active_window = 'test'

func _on_sound_on_pressed():
	Global.is_sound_playing = true
	Audio.play_click()

func _on_sound_off_pressed():
	Audio.play_click()
	Global.is_sound_playing = false


func _on_music_on_pressed():
	Audio.play_click()
	Global.is_music_playing = true
	if Audio.is_music_playing() == false:
		Audio.play_bg_music()

func _on_music_off_pressed():
	Audio.play_click()
	Global.is_music_playing = false
	Audio.stop_bg_music()

func disable_buttons(t):
	$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_on.disabled = t
	$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_off.disabled = t
	$Question_Tab/VBoxContainer/MarginContainer3/Music/music_on.disabled = t
	$Question_Tab/VBoxContainer/MarginContainer3/Music/music_off.disabled = t
	$Question_Tab/MarginContainer/close.disabled = t


func _on_sound_on_toggled(button_pressed):
	if Global.is_sound_playing == false:
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_off/AnimationPlayer.play("up")
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_on/AnimationPlayer.play("down")
	Global.is_sound_playing = true
	Audio.play_click()


func _on_sound_off_toggled(button_pressed):
	Audio.play_click()
	if Global.is_sound_playing == true:
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_off/AnimationPlayer.play("down")
		$Question_Tab/VBoxContainer/MarginContainer2/Sound/sound_on/AnimationPlayer.play("up")
	Global.is_sound_playing = false


func _on_music_on_toggled(button_pressed):
	Audio.play_click()
	if Global.is_music_playing == false:
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_off/AnimationPlayer.play("up")
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_on/AnimationPlayer.play("down")
	Global.is_music_playing = true
	if Audio.is_music_playing() == false:
		Audio.play_bg_music()

func _on_music_off_toggled(button_pressed):
	Audio.play_click()
	if Global.is_music_playing == true:
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_off/AnimationPlayer.play("down")
		$Question_Tab/VBoxContainer/MarginContainer3/Music/music_on/AnimationPlayer.play("up")
	Global.is_music_playing = false
	Audio.stop_bg_music()
