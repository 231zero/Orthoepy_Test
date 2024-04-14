extends Control

var words : Array = []
var correct_answer : String = ''
var user_answer : String = ''

var user_answer_button
var correct_answer_button

var count = -1

var correct_color = Color(1.0, 1.0, 1.0, 1.0)
var uncorrect_color = Color(1.0, 1.0, 1.0, 0.5)

@onready var word = $cart_1/Question_Tab/MarginContainer/VBoxContainer/Word

@onready var but_1 = $buttons_tab/VBoxContainer/Button_1
@onready var but_2 = $buttons_tab/VBoxContainer/Button_2
@onready var but_3 = $buttons_tab/VBoxContainer/Button_3
@onready var but_4 = $buttons_tab/VBoxContainer/Button_4

@onready var text_1 = $buttons_tab/VBoxContainer/Button_1/text
@onready var text_2 = $buttons_tab/VBoxContainer/Button_2/text
@onready var text_3 = $buttons_tab/VBoxContainer/Button_3/text
@onready var text_4 = $buttons_tab/VBoxContainer/Button_4/text

@onready var buttons = [but_1, but_2, but_3, but_4]
var elements_progress_bar : Array = []

func _ready():
	$AnimationPlayer.play("Animation_Start")
	Global.uncorrect_answers = []
	randomize()
	
	words = Global.words
	
	words.shuffle()
	
	var colorrect = load("res://Scenes/colorrect_prefab.tscn")
	for i in range(len(words)):
		var t = colorrect.instantiate()
		$progress_bar/HBoxContainer.add_child(t)
		elements_progress_bar.append(t)
	
	generate_question()


# LOGIC OF TEST
func generate_question():
	
#	if count != -1:
#		if count % 2 == 0:
#			$AnimationPlayer.play("change_cart_1")
#		else:
#			$AnimationPlayer.play("change_cart_2")
	
	randomize()
	count += 1
	
	if count == len(words):
		count = len(words) - 1
		$AnimationPlayer.play("Animation_End")
		await get_tree().create_timer(1.5).timeout
		
		Global.active_window = 'game_end'
		get_tree().change_scene_to_file("res://Scenes/game_end.tscn")
	
#	if count % 2 == 0:
#		word = $cart_1/Question_Tab/MarginContainer/VBoxContainer/Word
#	else:
#		word = $cart_2/Question_Tab/MarginContainer/VBoxContainer/Word
	
	disabled_buttons(false)
	reset_buttons()
	change_opacity(but_4, 255)
	change_opacity(but_3, 255)
	change_opacity(but_2, 255)
	
	correct_answer = words[count]
	
	if correct_answer == 'Отзыв (о книге)':
		correct_answer = 'Отзыв'
		word.get_parent().get_node('dop_info').text = '(о книге)'
	elif correct_answer == 'отзЫв (посла из страны)':
		correct_answer = 'отзЫв'
		word.get_parent().get_node('dop_info').text = '(посла из страны)'
	elif correct_answer == 'отозвАть (посла из страны)':
		correct_answer = 'отозвАть'
		word.get_parent().get_node('dop_info').text = '(посла из страны)'
	else:
		word.get_parent().get_node('dop_info').text = ''
	
	word.text = correct_answer.to_lower()
	
	var answers = create_answers(correct_answer.to_lower(), correct_answer)
	
	var n = correct_answer.split()
	for i in range(len(correct_answer)):
		if n[i].to_lower() != n[i]:
			n[i] = '[color=#00bed5]' + n[i].to_lower() + '[/color]'
			correct_answer = ''.join(n)
			break
	
	var count_of_possible_answers = len(answers) + 1
	var choose_button_correct_answer
	
	
	match count_of_possible_answers:
		1:
			change_opacity(but_4, 0)
			change_opacity(but_3, 0)
			change_opacity(but_2, 0)
			text_1.text = '[center]' + correct_answer
			correct_answer_button = but_1
		2:
			change_opacity(but_4, 0)
			change_opacity(but_3, 0)
			choose_button_correct_answer = randi() % 2
			match choose_button_correct_answer:
				0:
					text_1.text = '[center]' + correct_answer
					correct_answer_button = but_1
					text_2.text = '[center]' + answers[0]
				1:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + correct_answer
					correct_answer_button = but_2
			
		3:
			change_opacity(but_4, 0)
			choose_button_correct_answer = randi() % 3
			match choose_button_correct_answer:
				0:
					text_1.text = '[center]' + correct_answer
					correct_answer_button = but_1
					text_2.text = '[center]' + answers[0]
					text_3.text = '[center]' + answers[1]
				1:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + correct_answer
					correct_answer_button = but_2
					text_3.text = '[center]' + answers[1]
				2:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + answers[1]
					text_3.text = '[center]' + correct_answer
					correct_answer_button = but_3
		_:
			choose_button_correct_answer = randi() % 4
			match choose_button_correct_answer:
				0:
					text_1.text = '[center]' + correct_answer
					correct_answer_button = but_1
					text_2.text = '[center]' + answers[0]
					text_3.text = '[center]' + answers[1]
					text_4.text = '[center]' + answers[2]
				1:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + correct_answer
					correct_answer_button = but_2
					text_3.text = '[center]' + answers[1]
					text_4.text = '[center]' + answers[2]
				2:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + answers[1]
					text_3.text = '[center]' + correct_answer
					correct_answer_button = but_3
					text_4.text = '[center]' + answers[2]
				3:
					text_1.text = '[center]' + answers[0]
					text_2.text = '[center]' + answers[1]
					text_3.text = '[center]' + answers[2]
					text_4.text = '[center]' + correct_answer
					correct_answer_button = but_4


func create_answers(answer, correct_answer):
	var check
	var a = correct_answer.split()
	for i in range(len(correct_answer)):
		if a[i].to_lower() != a[i]:
			a[i] = '[color=#00bed5]' + a[i].to_lower() + '[/color]'
			check = ''.join(a)
			break
	print(check)
	
	var d = []
	for i in range(len(answer)):
		var n = answer.split()
		if answer[i] in ['а', 'о', 'у', 'ы', 'э', 'е', 'ё', 'и', 'ю', 'я']:
			n[i] = '[color=#00bed5]' + n[i] + '[/color]'
			if ''.join(n) != check:
				d.append(''.join(n))
	return d

func check_user_answer(answer):
	disabled_buttons(true)
	
	print('[center]' + correct_answer)
	print(answer)
	
	
	correct_answer_button.get_node('yes').visible = true
	correct_answer_button.get_node('outer').visible = true
	correct_answer_button.get_node('outer').modulate = Color.hex(0x5bd600ff)
	
	elements_progress_bar[count].color = correct_color
	
	if answer != '[center]' + correct_answer:
		Audio.play_click_uncorrect()
		user_answer_button.get_node('no').visible = true
		user_answer_button.get_node('outer').visible = true
		user_answer_button.get_node('outer').modulate = Color.hex(0xff221aff)
		
		elements_progress_bar[count].color = uncorrect_color
		
		Global.uncorrect_answers.append('[center]' + correct_answer)
	else:
		Audio.play_click_correct()
	
	elements_progress_bar[count].get_node('AnimationPlayer').play('start')
	
	$WaitTimer.start(2)



# STYLE OF BUTTONS
func change_opacity(button : Button, opacity : int):
	button.modulate.a8 = opacity
	if opacity == 0:
		button.disabled = true
	else:
		button.disabled = false

func disabled_buttons(is_disabled):
	for i in buttons:
		i.disabled = is_disabled

func reset_buttons():
	for i in buttons:
		i.get_node('yes').visible = false
		i.get_node('no').visible = false
		i.get_node('outer').visible = false



# CHECK USER INPUT
func _on_button_1_button_down():
	but_1.get_node("AnimationPlayer2").play('Tap')
	user_answer_button = but_1
	check_user_answer(text_1.text)

func _on_button_2_button_down():
	but_2.get_node("AnimationPlayer2").play('Tap')
	user_answer_button = but_2
	check_user_answer(text_2.text)

func _on_button_3_button_down():
	but_3.get_node("AnimationPlayer2").play('Tap')
	user_answer_button = but_3
	check_user_answer(text_3.text)

func _on_button_4_button_down():
	but_4.get_node("AnimationPlayer2").play('Tap')
	user_answer_button = but_4
	check_user_answer(text_4.text)



# WAIT TIMER ON THE END
func _on_wait_timer_timeout():
	generate_question()


func _on_button_pressed():
	disable_buttons(true)
	$CenterContainer/settings.disable_buttons(false)
	Audio.play_click()
	if Global.active_window == 'test':
		Audio.play_pop_up_window()
		$CenterContainer/settings.get_node('AnimationPlayer').play('popup')
		Global.active_window = 'settings_test'

func disable_buttons(t):
	$buttons_tab/VBoxContainer/Button_1.disabled = t
	$buttons_tab/VBoxContainer/Button_2.disabled = t
	$buttons_tab/VBoxContainer/Button_3.disabled = t
	$buttons_tab/VBoxContainer/Button_4.disabled = t
	$settings_tab/Button.disabled = t
