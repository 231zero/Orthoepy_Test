extends Control

func _ready():
	$AnimationPlayer.play("fade_out")
	if Audio.is_music_playing() == false and Global.is_music_playing == true:
		Audio.play_bg_music()
	$CenterContainer2/choose_test.get_node('AnimationPlayer').play('RESET')

func _on_button_pressed():
	disable_buttons(true)
	$CenterContainer2/choose_test.disable_buttons(false)
	Audio.play_click()
	if Global.active_window == 'menu':
		Audio.play_pop_up_window()
		$CenterContainer2/choose_test.get_node('AnimationPlayer').play('popup')
		Global.active_window = 'choose_test'


func _on_button_again_pressed():
	disable_buttons(true)
	$CenterContainer2/settings.disable_buttons(false)
	Audio.play_click()
	if Global.active_window == 'menu':
		Audio.play_pop_up_window()
		$CenterContainer2/settings.get_node('AnimationPlayer').play('popup')
		Global.active_window = 'settings'

func disable_buttons(t):
	$MENU/Button.disabled = t
	$MENU/Button_again.disabled = t
