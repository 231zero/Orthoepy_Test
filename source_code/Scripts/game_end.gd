extends Control

var one = true

func _ready():
	$AnimationPlayer.play("Fade_out")
	var text = load("res://Scenes/text.tscn")
	$Question.text = '[center]Вы завершили Тест {a}, и правильно овтетили на [color=00bed5]{b}/20 [/color]вопросов'.format({"a":Global.test, "b":20-len(Global.uncorrect_answers)})
	
	if len(Global.uncorrect_answers) == 0:
		$Word2.visible = false
		$Control.visible = false
		$Question.position = Vector2(0, 300)
		$Word.position = Vector2(0, 230)
		
	
	if len(Global.uncorrect_answers) <= 5:
		$Control/MarginContainer.visible = false
		var c = Control.new()
		c.custom_minimum_size = Vector2(600, 17)
		$Control/ScrollContainer/VBoxContainer.add_child(c)
	else:
		$Control/MarginContainer.visible = true
		var c = Control.new()
		c.custom_minimum_size = Vector2(600, 40)
		$Control/ScrollContainer/VBoxContainer.add_child(c)
	
	for i in Global.uncorrect_answers:
		var t = text.instantiate()
		t.text = i
		$Control/ScrollContainer/VBoxContainer.add_child(t)
	
	if len(Global.uncorrect_answers) > 5:
		var c = Control.new()
		c.custom_minimum_size = Vector2(600, 40)
		$Control/ScrollContainer/VBoxContainer.add_child(c)


func _on_button_pressed():
	Audio.play_click()
	Global.active_window = 'menu'
	
	$AnimationPlayer.play("Fade_in")
	await get_tree().create_timer(1).timeout
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/main_menu.tscn")


func _on_button_again_pressed():
	Audio.play_click()
	Global.active_window = 'test'
	
	$AnimationPlayer.play("Fade_in")
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Scenes/test.tscn")
